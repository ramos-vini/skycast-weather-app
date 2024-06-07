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
  // TODO: Check if it's possible to delete this function and directly call setTimeframe
  void selectTimeframe(String selectedTimeframe) {
    setState(() {
      widget.setTimeframe(selectedTimeframe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: Iterate through timeframes to display TimeframeButtons
        TimeframeButton(
            selectedTimeframe: 'today',
            selectTimeframe: selectTimeframe,
            currentTimeframe: widget.currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'tomorrow',
            selectTimeframe: selectTimeframe,
            currentTimeframe: widget.currentTimeframe),
        TimeframeButton(
            selectedTimeframe: 'week',
            selectTimeframe: selectTimeframe,
            currentTimeframe: widget.currentTimeframe),
      ],
    );
  }
}
