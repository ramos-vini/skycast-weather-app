import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/services/location_service.dart';
import 'package:app/models/location.dart';

class LocationProvider with ChangeNotifier {
  Location? _currentLocation;
  bool _loading = true;
  final LocationService _locationService = LocationService();

  Location? get currentLocation => _currentLocation;
  bool get loading => _loading;

  LocationProvider() {
    _fetchInitialPosition();
  }

  Future<void> _fetchInitialPosition() async {
    try {
      Position position = await _locationService.determinePosition();
      _currentLocation = Location(
        name:
            'Current Location', // You can customize this based on your app's needs
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print('Error getting location: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void setLocation(String name, double latitude, double longitude) {
    _currentLocation = Location(
      name: name,
      latitude: latitude,
      longitude: longitude,
    );
    notifyListeners();
  }
}
