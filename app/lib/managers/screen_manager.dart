import 'package:flutter/material.dart';
import 'package:app/screens/weather_screen.dart';
import 'package:app/screens/forecast_screen.dart';

class ScreenManager {
  static const Map<String, Widget> _timeframesMap = {
    'today': WeatherScreen(timeframe: 'today'),
    'tomorrow': WeatherScreen(timeframe: 'tomorrow'),
    'week': ForecastScreen()
  };

  static Widget getScreenByTimeframe(String timeframe) {
    return _timeframesMap[timeframe] ?? const Center(child: Text('Invalid timeframe'));
  }

  static List<String> getTimeframes() {
    return _timeframesMap.keys.toList();
  }
}
