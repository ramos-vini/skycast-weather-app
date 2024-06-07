import 'package:app/widgets/timeframe_button.dart';
import 'package:flutter/material.dart';

class TimeframeSelector extends StatefulWidget {
  TimeframeSelector(
      {super.key, required this.currentTimeframe, required this.setTimeframe});

  String currentTimeframe;
  final void Function(String) setTimeframe;

  @override
  State<TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<TimeframeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: Iterate through timeframes to display TimeframeButtons
        TimeframeButton(
            selectedTimeframe: 'today',
            setTimeframe: widget.setTimeframe,
            currentTimeframe: widget.currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'tomorrow',
            setTimeframe: widget.setTimeframe,
            currentTimeframe: widget.currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'week',
            setTimeframe: widget.setTimeframe,
            currentTimeframe: widget.currentTimeframe),
      ],
    );
  }
}
