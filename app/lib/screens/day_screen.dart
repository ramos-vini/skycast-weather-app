import 'package:flutter/material.dart';
import 'package:app/widgets/day_conditions.dart';
import 'package:app/widgets/day_temperature.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/current_weather_provider.dart';

class DayScreen extends StatefulWidget {
  const DayScreen(String timeframe, {super.key});

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch weather data when the widget is first displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TODO: Input dynamic latitude and longitude
      context.read<WeatherProvider>().fetchWeather(52.0, 13.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
      if (weatherProvider.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (weatherProvider.weather == null) {
        return const Center(
            child: Text('Failed to load weather data',
                style: TextStyle(color: Colors.white)));
      }

      final weather = weatherProvider.weather!;

      return Column(
        children: [
          DayConditions(weather: weather),
          const SizedBox(height: 80),
          DayTemperature(weather: weather),
        ],
      );
    });
  }
}
