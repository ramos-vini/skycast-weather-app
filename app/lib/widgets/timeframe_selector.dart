import 'package:app/data/app_colors.dart';
import 'package:flutter/material.dart';

class TimeframeSelector extends StatelessWidget {
  const TimeframeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'TODAY',
            // TODO: Change style based on selected view
            style:
                TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'TOMORROW',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'WEEK',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
