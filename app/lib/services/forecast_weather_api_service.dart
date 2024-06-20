import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/forecast_weather.dart';
import 'package:app/config/config.dart';

class ForecastApiService {
  static const String apiKey = openWeatherApiKey;
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/forecast';

  Future<WeatherForecast> fetchForecast(double lat, double lon) async {
    print('Fetching weather forecast data for latitude: $lat, longitude: $lon');

    final response = await http.get(
        Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}