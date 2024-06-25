import 'package:flutter/material.dart';
import 'package:app/models/weather.dart';
import 'package:app/models/forecast.dart';
import 'package:app/utils/weather_icon_mapper.dart';

class WeatherTemperature extends StatelessWidget {
  const WeatherTemperature({Key? key, required this.weather}) : super(key: key);

  final dynamic weather; // Can accept both Weather and Forecast objects

  @override
  Widget build(BuildContext context) {
    double temp;
    double tempMax;
    double tempMin;
    String main;
    String icon;

    if (weather is Weather) {
      temp = weather.main.temp;
      tempMax = weather.main.tempMax;
      tempMin = weather.main.tempMin;
      main = weather.weather[0].main;
      icon = weather.weather[0].icon;
    } else if (weather is Forecast) {
      temp = weather.temp;
      tempMax = weather.tempMax;
      tempMin = weather.tempMin;
      main = weather.main;
      icon = weather.icon;
    } else {
      throw ArgumentError('Unsupported weather type');
    }

    return Column(
      children: [
        // TODO: Fix Alignment
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${temp.round()}',
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '↑${tempMax.round()}°',
                  style: const TextStyle(
                    color: Color.fromARGB(140, 255, 255, 255),
                    fontSize: 22,
                  ),
                ),
                Text(
                  '↓${tempMin.round()}°',
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
          main,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(height: 30),
        Icon(getWeatherIcon(main),
            color: const Color.fromARGB(140, 255, 255, 255), size: 140)
      ],
    );
  }
}
