import 'package:flutter/material.dart';
import 'package:app/widgets/week_day_conditions.dart';

class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fake 7 days of the week
    List<Widget> weekDays = [];
    for (int i = 1; i <= 7; i++) {
      weekDays.add(WeekDayConditions(lastDay: i == 7 ? true : false));
    }

    return Column(
      children: [...weekDays],
    );
  }
}
