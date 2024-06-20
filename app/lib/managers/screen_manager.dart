import 'package:flutter/material.dart';
import 'package:app/screens/weather_screen.dart';
import 'package:app/screens/forecast_screen.dart';

class ScreenManager {
  static const Map<String, Widget> _timeframesMap = {
    'today': WeatherScreen('today'),
    'tomorrow': WeatherScreen('tomorrow'),
    'forecast': ForecastScreen()
  };

  static Widget? getScreenByTimeframe(String timeframe) {
    return _timeframesMap[timeframe];
  }

  static List<String> getTimeframes() {
    return _timeframesMap.keys.toList();
  }
}
