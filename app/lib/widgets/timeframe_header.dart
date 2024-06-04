import 'package:flutter/material.dart';

class TimeframeHeader extends StatelessWidget {
  const TimeframeHeader({
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
            style: TextStyle(color: Colors.white),
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
