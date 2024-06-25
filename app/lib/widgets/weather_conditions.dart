import 'package:flutter/material.dart';
import 'package:app/models/weather.dart';
import 'package:app/models/forecast.dart';

class WeatherConditions extends StatelessWidget {
  const WeatherConditions({Key? key, required this.weather}) : super(key: key);

  final dynamic weather; // Can accept both Weather and Forecast objects

  @override
  Widget build(BuildContext context) {
    int clouds;
    double windSpeed;
    int humidity;

    if (weather is Weather) {
      clouds = weather.clouds.all;
      windSpeed = weather.wind.speed;
      humidity = weather.main.humidity;
    } else if (weather is Forecast) {
      clouds = weather.clouds.toInt();
      windSpeed = weather.windSpeed;
      humidity = weather.humidity.toInt();
    } else {
      throw ArgumentError('Unsupported weather type');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(
              Icons.cloud_outlined,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 6),
            Text(
              '$clouds%',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.air_outlined,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 6),
            Text(
              '${windSpeed.toStringAsFixed(1)} m/s',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.water_drop_outlined,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 6),
            Text(
              '$humidity%',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
