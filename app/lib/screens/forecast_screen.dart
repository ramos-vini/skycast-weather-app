import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/forecast_provider.dart';
import 'package:app/widgets/forecast_conditions.dart';
import 'package:app/providers/location_provider.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch forecast data when the widget is first displayed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchForecast();
    });
  }

  Future<void> _fetchForecast() async {
    final locationProvider = context.read<LocationProvider>();
    if (locationProvider.currentPosition != null) {
      context.read<ForecastProvider>().fetchForecast(
          locationProvider.currentPosition!.latitude,
          locationProvider.currentPosition!.longitude);
    } else {
      print('No position available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        if (locationProvider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Consumer<ForecastProvider>(
          builder: (context, forecastProvider, child) {
            if (forecastProvider.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (forecastProvider.forecast == null) {
              return const Center(
                  child: Text('Failed to load forecast data',
                      style: TextStyle(color: Colors.white)));
            }

            final forecasts = forecastProvider.forecast!.forecasts;

            return ListView.builder(
              itemCount: forecasts.length,
              itemBuilder: (context, index) {
                final forecast = forecasts[index];
                return ForecastConditions(
                  forecast: forecast,
                  lastDay: index == forecasts.length - 1,
                );
              },
            );
          },
        );
      },
    );
  }
}
