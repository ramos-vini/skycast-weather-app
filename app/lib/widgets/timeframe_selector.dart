import 'package:app/widgets/timeframe_button.dart';
import 'package:flutter/material.dart';
import 'package:app/managers/screen_manager.dart';

class TimeframeSelector extends StatefulWidget {
  const TimeframeSelector(
      {super.key, required this.currentTimeframe, required this.setTimeframe});

  final String currentTimeframe;
  final void Function(String) setTimeframe;

  @override
  State<TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<TimeframeSelector> {
  List<String> timeframes = ScreenManager.getTimeframes();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...timeframes.map((timeframe) {
          return TimeframeButton(
              selectedTimeframe: timeframe,
              setTimeframe: widget.setTimeframe,
              currentTimeframe: widget.currentTimeframe);
        })
      ],
    );
  }
}
