import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/city.dart';

class CityApiService {
  final String _baseUrl = 'http://api.openweathermap.org/geo/1.0/direct';
  final String _apiKey = 'your_api_key_here';

  Future<List<City>> fetchCitiesByName(String cityName) async {
    final response = await http
        .get(Uri.parse('$_baseUrl?q=$cityName&limit=5&appid=$_apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> citiesJson = json.decode(response.body);
      return citiesJson.map((json) => City.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
