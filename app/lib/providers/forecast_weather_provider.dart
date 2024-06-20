import 'package:flutter/material.dart';
import 'package:app/models/forecast_weather.dart';
import 'package:app/services/forecast_weather_api_service.dart';

class ForecastProvider with ChangeNotifier {
  WeatherForecast? _forecast;
  bool _loading = false;

  WeatherForecast? get forecast => _forecast;
  bool get loading => _loading;

  Future<void> fetchForecast(double lat, double lon) async {
    print('Provider: Fetching weather forecast data for latitude: $lat, longitude: $lon');

    _loading = true;
    notifyListeners();

    try {
      _forecast = await ForecastApiService().fetchForecast(lat, lon);
    } catch (e) {
      print('Error fetching weather forecast data: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}