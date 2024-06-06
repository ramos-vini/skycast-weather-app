import 'package:app/data/app_colors.dart';
import 'package:app/screens/day_screen.dart';
import 'package:app/screens/week_screen.dart';
import 'package:flutter/material.dart';

class TimeframeSelector extends StatefulWidget {
  const TimeframeSelector({super.key, required this.setTimeframe});

  final void Function(Widget) setTimeframe;

  @override
  State<TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<TimeframeSelector> {
  String selectedTimeframe = 'today';

  void selectTimeframe(String timeframe) {
    switch (timeframe) {
      case 'today':
        setState(() {
          selectedTimeframe = timeframe;
          widget.setTimeframe(const DayScreen());
        });
        break;

      case 'tomorrow':
        setState(() {
          selectedTimeframe = timeframe;
          widget.setTimeframe(const DayScreen());
        });
        break;

      case 'week':
        setState(() {
          selectedTimeframe = timeframe;
          widget.setTimeframe(const WeekScreen());
        });
        break;

      default:
        'today';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            selectTimeframe('today');
          },
          child: Text('TODAY',
              style: selectedTimeframe == 'today'
                  ? const TextStyle(
                      color: AppColors.yellow, fontWeight: FontWeight.bold)
                  : const TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            selectTimeframe('tomorrow');
          },
          child: Text(
            'TOMORROW',
            style: selectedTimeframe == 'tomorrow'
                ? const TextStyle(
                    color: AppColors.yellow, fontWeight: FontWeight.bold)
                : const TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            selectTimeframe('week');
          },
          child: Text(
            'WEEK',
            style: selectedTimeframe == 'week'
                ? const TextStyle(
                    color: AppColors.yellow, fontWeight: FontWeight.bold)
                : const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
