import 'package:flutter/material.dart';
import 'package:app/models/current_weather.dart';

class DayConditions extends StatelessWidget {
  const DayConditions({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
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
              '${weather.clouds.all}%',
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
              '${weather.wind.speed.toStringAsFixed(1)} m/s',
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
              '${weather.main.humidity}%',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
