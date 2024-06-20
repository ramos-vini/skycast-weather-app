import 'package:flutter/material.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/utils/weather_icon_mapper.dart';

class DayTemperature extends StatelessWidget {
  const DayTemperature({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: Fix Alignment
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weather.main.temp.round()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 130,
                height: 0.7,
              ),
            ),
            Column(
              children: [
                const Text(
                  '°C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      height: 0.7,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '↑${weather.main.tempMax.round()}°',
                  style: const TextStyle(
                    color: Color.fromARGB(140, 255, 255, 255),
                    fontSize: 22,
                  ),
                ),
                Text(
                  '↓${weather.main.tempMin.round()}°',
                  style: const TextStyle(
                    color: Color.fromARGB(140, 255, 255, 255),
                    fontSize: 22,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 30),
        Text(
          weather.weather[0].main,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(height: 30),
        Icon(getWeatherIcon(weather.weather[0].main),
            color: const Color.fromARGB(140, 255, 255, 255), size: 140)
      ],
    );
  }
}
