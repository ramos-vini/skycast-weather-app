import 'package:flutter/material.dart';
import 'package:app/models/city.dart';
import 'package:app/services/city_api_service.dart';

class CityProvider with ChangeNotifier {
  List<City>? _cities;
  bool _loading = false;

  List<City>? get cities => _cities;
  bool get loading => _loading;

  Future<void> fetchCities(String cityName) async {
    _loading = true;
    notifyListeners();

    try {
      _cities = await CityApiService().fetchCitiesByName(cityName);
    } catch (e) {
      print('Error fetching cities: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
