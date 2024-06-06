import 'package:flutter/material.dart';
import 'package:app/widgets/day_conditions.dart';
import 'package:app/widgets/day_temperature.dart';

class DayScreen extends StatefulWidget {
  const DayScreen({super.key});

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DayConditions(),
        SizedBox(height: 80),
        DayTemperature(),
      ],
    );
  }
}
