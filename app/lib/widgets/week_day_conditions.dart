import 'package:flutter/material.dart';
import 'package:app/models/forecast_weather.dart';

class WeekDayConditions extends StatelessWidget {
  final Forecast forecast;
  final bool lastDay;

  const WeekDayConditions({
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
                  forecast.date
                      .toLocal()
                      .toString()
                      .split(' ')[0], // Display date
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  forecast.description, // Display description
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons
                      .wb_sunny_rounded, // Example icon, you might want to map this based on forecast data
                  color: Colors.yellow,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${forecast.temp}°C', // Display temperature
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${forecast.tempMin}°C', // Display min temperature
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