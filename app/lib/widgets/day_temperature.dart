import 'package:flutter/material.dart';

class DayTemperature extends StatefulWidget {
  const DayTemperature({super.key});

  @override
  State<DayTemperature> createState() => _DayTemperatureState();
}

class _DayTemperatureState extends State<DayTemperature> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4',
              style: TextStyle(
                color: Colors.white,
                fontSize: 130,
                height: 0.7,
              ),
            ),
            Column(
              children: [
                Text(
                  '°C',
                  style:
                      TextStyle(color: Colors.white, fontSize: 34, height: 0.7, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  '↑5°',
                  style: TextStyle(
                      color: Color.fromARGB(180, 255, 255, 255), fontSize: 22),
                ),
                Text(
                  '↓4°',
                  style: TextStyle(
                      color: Color.fromARGB(180, 255, 255, 255), fontSize: 22, height: 0.7),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 30),
        Text(
          'Haze',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        SizedBox(height: 30),
        Icon(
          Icons.cloud_outlined,
          color: Color.fromARGB(180, 255, 255, 255),
          size: 140,
        )
      ],
    );
  }
}
