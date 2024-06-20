import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/forecast_weather_provider.dart';
import 'package:app/widgets/week_day_conditions.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  _WeekScreenState createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch forecast data when the widget is first displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TODO: Input dynamic latitude and longitude
      context.read<ForecastProvider>().fetchForecast(52.0, 13.0);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            return WeekDayConditions(
              forecast: forecast,
              lastDay: index == forecasts.length - 1,
            );
          },
        );
      },
    );
  }
}
