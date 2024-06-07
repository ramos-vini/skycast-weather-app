import 'package:app/screens/day_screen.dart';
import 'package:app/screens/week_screen.dart';
import 'package:app/widgets/timeframe_button.dart';
import 'package:flutter/material.dart';

class TimeframeSelector extends StatefulWidget {
  const TimeframeSelector({super.key, required this.setTimeframe});

  final void Function(Widget) setTimeframe;

  @override
  State<TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<TimeframeSelector> {
  String currentTimeframe = 'today';

  void selectTimeframe(String timeframe) {
    switch (timeframe) {
      case 'today':
        setState(() {
          currentTimeframe = timeframe;
          widget.setTimeframe(const DayScreen());
        });
        break;

      case 'tomorrow':
        setState(() {
          currentTimeframe = timeframe;
          widget.setTimeframe(const DayScreen());
        });
        break;

      case 'week':
        setState(() {
          currentTimeframe = timeframe;
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
        TimeframeButton(
            selectedTimeframe: 'today',
            selectTimeframe: selectTimeframe,
            currentTimeframe: currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'tomorrow',
            selectTimeframe: selectTimeframe,
            currentTimeframe: currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'week',
            selectTimeframe: selectTimeframe,
            currentTimeframe: currentTimeframe),
      ],
    );
  }
}
