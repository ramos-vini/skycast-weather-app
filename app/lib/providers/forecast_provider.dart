import 'package:flutter/material.dart';
import 'package:app/models/forecast.dart';
import 'package:app/services/forecast_api_service.dart';

class ForecastProvider with ChangeNotifier {
  WeatherForecast? _forecast;
  bool _loading = false;
  final ForecastApiService _forecastApiService = ForecastApiService();

  WeatherForecast? get forecast => _forecast;
  bool get loading => _loading;

  Future<void> fetchForecast(double lat, double lon) async {
    print(
        'Provider: Fetching weather forecast data for latitude: $lat, longitude: $lon');

    _loading = true;
    notifyListeners();

    try {
      WeatherForecast fullForecast =
          await _forecastApiService.fetchForecast(lat, lon);

      // Group forecasts by day
      Map<String, List<Forecast>> forecastsByDay = {};
      for (Forecast forecast in fullForecast.forecasts) {
        String day = forecast.date.toIso8601String().substring(0, 10);
        if (forecastsByDay.containsKey(day)) {
          forecastsByDay[day]!.add(forecast);
        } else {
          forecastsByDay[day] = [forecast];
        }
      }

      // Filter out the current day
      DateTime today = DateTime.now();
      String todayStr = today.toIso8601String().substring(0, 10);
      forecastsByDay.remove(todayStr);

      // Sort the keys (dates) to ensure we process them in order
      List<String> sortedDays = forecastsByDay.keys.toList()..sort();

      // Take only the first 5 days starting from tomorrow
      List<String> nextFiveDays = sortedDays.take(5).toList();

      // Calculate averaged forecasts for each of the next 5 days
      List<Forecast> averagedForecasts = [];
      for (String day in nextFiveDays) {
        List<Forecast> forecasts = forecastsByDay[day]!;

        double tempSum = 0;
        double feelsLikeSum = 0;
        double minTemp = double.infinity;
        double maxTemp = double.negativeInfinity;
        double pressureSum = 0;
        double humiditySum = 0;
        double windSpeedSum = 0;
        double windDegSum = 0;
        double cloudsSum = 0;
        double visibilitySum = 0;
        double windGustSum = 0;
        double popSum = 0;
        double rainVolumeSum = 0;
        double snowVolumeSum = 0;
        int windGustCount = 0;
        int popCount = 0;
        int rainVolumeCount = 0;
        int snowVolumeCount = 0;

        for (Forecast forecast in forecasts) {
          tempSum += forecast.temp;
          feelsLikeSum += forecast.feelsLike;
          if (forecast.tempMin < minTemp) minTemp = forecast.tempMin;
          if (forecast.tempMax > maxTemp) maxTemp = forecast.tempMax;
          pressureSum += forecast.pressure;
          humiditySum += forecast.humidity;
          windSpeedSum += forecast.windSpeed;
          windDegSum += forecast.windDeg;
          cloudsSum += forecast.clouds;
          visibilitySum += forecast.visibility;

          if (forecast.windGust != null) {
            windGustSum += forecast.windGust!;
            windGustCount++;
          }
          if (forecast.pop != null) {
            popSum += forecast.pop!;
            popCount++;
          }
          if (forecast.rainVolume != null) {
            rainVolumeSum += forecast.rainVolume!;
            rainVolumeCount++;
          }
          if (forecast.snowVolume != null) {
            snowVolumeSum += forecast.snowVolume!;
            snowVolumeCount++;
          }
        }

        double averageTemp = tempSum / forecasts.length;
        double averageFeelsLike = feelsLikeSum / forecasts.length;
        double averagePressure = pressureSum / forecasts.length;
        double averageHumidity = humiditySum / forecasts.length;
        double averageWindSpeed = windSpeedSum / forecasts.length;
        double averageWindDeg = windDegSum / forecasts.length;
        double averageClouds = cloudsSum / forecasts.length;
        double averageVisibility = visibilitySum / forecasts.length;
        double? averageWindGust =
            windGustCount > 0 ? windGustSum / windGustCount : null;
        double? averagePop = popCount > 0 ? popSum / popCount : null;
        double? averageRainVolume =
            rainVolumeCount > 0 ? rainVolumeSum / rainVolumeCount : null;
        double? averageSnowVolume =
            snowVolumeCount > 0 ? snowVolumeSum / snowVolumeCount : null;

        averagedForecasts.add(Forecast(
          date: DateTime.parse(day),
          temp: averageTemp,
          tempMin: minTemp,
          tempMax: maxTemp,
          feelsLike: averageFeelsLike,
          pressure: averagePressure.toInt(),
          humidity: averageHumidity.toInt(),
          description: forecasts[0]
              .description, // Assuming all descriptions are the same
          main:
              forecasts[0].main, // Assuming all main descriptions are the same
          icon: forecasts[0].icon, // Assuming all icons are the same
          windSpeed: averageWindSpeed,
          windDeg: averageWindDeg.toInt(),
          clouds: averageClouds.toInt(),
          visibility: averageVisibility.toInt(),
          windGust: averageWindGust,
          pop: averagePop,
          rainVolume: averageRainVolume,
          snowVolume: averageSnowVolume,
        ));
      }

      _forecast = WeatherForecast(
        forecasts: averagedForecasts,
        cityName: fullForecast.cityName,
      );
    } catch (e) {
      print('Error fetching weather forecast data: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
