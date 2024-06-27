import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:app/services/location_service.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/models/location.dart';
import 'package:app/models/weather.dart';

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
      // Fetch the weather data to get the city name
      await context.read<WeatherProvider>().fetchWeather(
          currentPosition.latitude, currentPosition.longitude);

      Weather? weather = context.read<WeatherProvider>().weather;
      String cityName = weather?.name ?? 'Unknown';

      // Set the current location
      _currentLocation = Location(
        name: cityName,
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      );
    } catch (e) {
      print('Error getting location: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void setPosition(double latitude, double longitude) {
    _currentLocation = Location(
      name: '', // Clear the name initially
      latitude: latitude,
      longitude: longitude,
    );
    notifyListeners();
  }
}
