import 'package:flutter/material.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/weather_api_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _loading = false;

  Weather? get weather => _weather;
  bool get loading => _loading;

  Future<void> fetchWeather(double lat, double lon) async {
    print('Provider: Fetching weather data for latitude: $lat, longitude: $lon');

    _loading = true;
    notifyListeners();

    try {
      _weather = await ApiService().fetchWeather(lat, lon);
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
