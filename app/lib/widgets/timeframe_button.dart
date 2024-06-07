import 'package:flutter/material.dart';
import 'package:app/data/app_colors.dart';

class TimeframeButton extends StatefulWidget {
  TimeframeButton(
      {super.key,
      required this.selectedTimeframe,
      required this.selectTimeframe,
      required this.currentTimeframe});

  String selectedTimeframe;
  void Function(String) selectTimeframe;
  String currentTimeframe;

  @override
  State<TimeframeButton> createState() => _TimeframeButtonState();
}

class _TimeframeButtonState extends State<TimeframeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.selectTimeframe(widget.selectedTimeframe);
      },
      child: Text(widget.selectedTimeframe.toUpperCase(),
          style: widget.currentTimeframe == widget.selectedTimeframe
              ? const TextStyle(
                  color: AppColors.yellow, fontWeight: FontWeight.bold)
              : const TextStyle(color: Colors.white)),
    );
  }
}
