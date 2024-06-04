import 'package:flutter/material.dart';

class DayTemperature extends StatefulWidget {
  const DayTemperature({super.key});

  @override
  State<DayTemperature> createState() => _DayTemperatureState();
}

class _DayTemperatureState extends State<DayTemperature> {
  @override
  Widget build(BuildContext context) {
    return const Text('Day Temperature');
  }
}