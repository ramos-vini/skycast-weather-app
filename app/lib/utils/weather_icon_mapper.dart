import 'package:flutter/material.dart';

final Map<String, Icon> weatherConditionIcons = {
  'Clear': const Icon(Icons.wb_sunny_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Clouds': const Icon(Icons.cloud_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Rain': const Icon(Icons.water_drop_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Snow': const Icon(Icons.ac_unit_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Thunderstorm': const Icon(Icons.flash_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Drizzle': const Icon(Icons.grain_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Mist': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Smoke': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Haze': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Dust': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Fog': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Sand': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Ash': const Icon(Icons.blur_on_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Squall': const Icon(Icons.air_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
  'Tornado': const Icon(Icons.error_outlined,
      color: Color.fromARGB(140, 255, 255, 255), size: 140),
};

Icon getWeatherIcon(String condition) {
  return weatherConditionIcons[condition] ??
      const Icon(Icons.help_outline,
          color: Color.fromARGB(140, 255, 255, 255), size: 140);
}
