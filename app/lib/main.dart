import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/providers/forecast_provider.dart';
import 'package:app/providers/location_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => ForecastProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider(context)),
      ],
      child: const MaterialApp(
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}
