import 'package:flutter/material.dart';
import 'package:app/screens/day_screen.dart';
import 'package:app/screens/week_screen.dart';

class ScreenManager {
  static const Map<String, Widget> _timeframesMap = {
    'today': DayScreen('today'),
    'tomorrow': DayScreen('tomorrow'),
    'week': WeekScreen()
  };

  static Widget? getScreenByTimeframe(String timeframe) {
    return _timeframesMap[timeframe];
  }

  static List<String> getTimeframes() {
    return _timeframesMap.keys.toList();
  }
}
