import 'package:flutter/material.dart';
import 'package:app/data/app_colors.dart';

class TimeframeButton extends StatefulWidget {
  TimeframeButton(
      {super.key,
      required this.selectedTimeframe,
      required this.setTimeframe,
      required this.currentTimeframe});

  String selectedTimeframe;
  void Function(String) setTimeframe;
  String currentTimeframe;

  @override
  State<TimeframeButton> createState() => _TimeframeButtonState();
}

class _TimeframeButtonState extends State<TimeframeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
    //TODO: Fix Alignment
    //   style: 
    //   ButtonStyle(
    //   backgroundColor: MaterialStatePropertyAll(Colors.red),
    //  // padding: MaterialStatePropertyAll(EdgeInsets.all(0))
    //  ),

      onPressed: () {
        widget.setTimeframe(widget.selectedTimeframe);
      },
      child: Text(widget.selectedTimeframe.toUpperCase(),
          style: widget.currentTimeframe == widget.selectedTimeframe
              ? const TextStyle(
                  color: AppColors.yellow, fontWeight: FontWeight.bold)
              : const TextStyle(color: Colors.white)),
    );
  }
}
