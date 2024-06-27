import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/services/location_service.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  bool _loading = true;
  final LocationService _locationService = LocationService();

  Position? get currentPosition => _currentPosition;
  bool get loading => _loading;

  LocationProvider() {
    _fetchInitialPosition();
  }

  Future<void> _fetchInitialPosition() async {
    try {
      _currentPosition = await _locationService.determinePosition();
    } catch (e) {
      print('Error getting location: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void setPosition(double latitude, double longitude) {
    _currentPosition = Position(
      latitude: latitude,
      longitude: longitude,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
    notifyListeners();
  }
}
