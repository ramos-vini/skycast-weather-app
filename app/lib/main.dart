import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/providers/forecast_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => ForecastProvider()),
      ],
      child: const MaterialApp(
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}
