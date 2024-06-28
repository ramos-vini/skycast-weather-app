import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:app/services/location_service.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/models/location.dart';
import 'package:app/models/weather.dart';
import 'package:app/models/city.dart';

class LocationProvider with ChangeNotifier {
  Location? _currentLocation;
  bool _loading = true;
  final LocationService _locationService = LocationService();

  Location? get currentLocation => _currentLocation;
  bool get loading => _loading;

  LocationProvider(BuildContext context) {
    _fetchInitialPosition(context);
  }

  Future<void> _fetchInitialPosition(BuildContext context) async {
    try {
      Position currentPosition = await _locationService.determinePosition();
      await setLocationByCoordinates(
          context, currentPosition.latitude, currentPosition.longitude);
    } catch (e) {
      print('Error getting location: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> setLocationByCoordinates(
      BuildContext context, double latitude, double longitude) async {
    try {
      // Set the initial coordinates
      _currentLocation = Location(
        name: '', // Clear the name initially
        latitude: latitude,
        longitude: longitude,
      );
      notifyListeners();

      // Fetch the weather data to get the city name
      await context.read<WeatherProvider>().fetchWeather(latitude, longitude);
      Weather? weather = context.read<WeatherProvider>().weather;
      String cityName = weather?.name ?? 'Unknown';

      // Update the location with the city name
      _currentLocation = Location(
        name: cityName,
        latitude: latitude,
        longitude: longitude,
      );
      notifyListeners();
    } catch (e) {
      print('Error updating location name: $e');
    }
  }

  Future<void> setLocationByCity(City city) async {
    try {
      // Update the location with the city's details
      _currentLocation = Location(
        name: city.name,
        latitude: city.lat,
        longitude: city.lon,
      );
      notifyListeners();
    } catch (e) {
      print('Error setting location by city: $e');
    }
  }
}
