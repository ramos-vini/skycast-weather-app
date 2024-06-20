import 'package:flutter/material.dart';
import 'package:app/models/forecast.dart';
import 'package:app/utils/weather_icon_mapper.dart';
import 'package:app/utils/date_formatter.dart';

class ForecastConditions extends StatelessWidget {
  final Forecast forecast;
  final bool lastDay;

  const ForecastConditions({
    super.key,
    required this.forecast,
    this.lastDay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatDate(forecast.date),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  forecast.main, // Display main description
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  getWeatherIcon(forecast.main),
                  color: const Color.fromARGB(140, 255, 255, 255),
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO: Display the min and max temperatures of the day, not of the 3h span
                    Text(
                      '${forecast.tempMax.round()}°C', // Display max temperature
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${forecast.tempMin.round()}°C', // Display min temperature
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        if (!lastDay)
          const Divider(
            color: Color.fromARGB(40, 255, 255, 255),
            height: 40,
          ),
      ],
    );
  }
}
