import 'package:flutter/material.dart';

final Map<String, IconData> weatherConditionIcons = {
  'Clear': Icons.wb_sunny_outlined,
  'Clouds': Icons.cloud_outlined,
  'Rain': Icons.water_drop_outlined,
  'Snow': Icons.ac_unit_outlined,
  'Thunderstorm': Icons.flash_on_outlined,
  'Drizzle': Icons.grain_outlined,
  'Mist': Icons.blur_on_outlined,
  'Smoke': Icons.blur_on_outlined,
  'Haze': Icons.blur_on_outlined,
  'Dust': Icons.blur_on_outlined,
  'Fog': Icons.blur_on_outlined,
  'Sand': Icons.blur_on_outlined,
  'Ash': Icons.blur_on_outlined,
  'Squall': Icons.air_outlined,
  'Tornado': Icons.error_outlined,
};

IconData getWeatherIcon(String condition) {
  return weatherConditionIcons[condition] ?? Icons.help_outline;
}
