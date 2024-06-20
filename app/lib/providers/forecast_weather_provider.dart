import 'package:flutter/material.dart';
import 'package:app/models/forecast_weather.dart';
import 'package:app/services/forecast_weather_api_service.dart';

class ForecastProvider with ChangeNotifier {
  WeatherForecast? _forecast;
  bool _loading = false;

  WeatherForecast? get forecast => _forecast;
  bool get loading => _loading;

  Future<void> fetchForecast(double lat, double lon) async {
    print(
        'Provider: Fetching weather forecast data for latitude: $lat, longitude: $lon');

    _loading = true;
    notifyListeners();

    try {
      WeatherForecast fullForecast =
          await ForecastApiService().fetchForecast(lat, lon);

      // Filter forecasts to get only the 4th forecast of each day (12:00 PM)
      List<Forecast> filteredForecasts = [];
      DateTime currentDay;
      int count = 0;

      for (Forecast forecast in fullForecast.forecasts) {
        DateTime forecastDate = forecast.date;
        if (count % 8 == 3) {
          filteredForecasts.add(forecast);
        }
        count++;
      }

      _forecast = WeatherForecast(
          forecasts: filteredForecasts, cityName: fullForecast.cityName);
    } catch (e) {
      print('Error fetching weather forecast data: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}