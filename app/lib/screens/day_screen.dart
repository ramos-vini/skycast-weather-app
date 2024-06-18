import 'package:flutter/material.dart';
import 'package:app/widgets/day_conditions.dart';
import 'package:app/widgets/day_temperature.dart';

class DayScreen extends StatelessWidget {
  const DayScreen(String timeframe, {super.key});

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
