import 'package:flutter/material.dart';

class WeekDayConditions extends StatelessWidget {
  const WeekDayConditions({super.key, this.lastDay = false});

  // control variable for the Divider Widget
  // false: present; true: not present
  final bool lastDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today, Jun 08',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Clear',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.wb_sunny_rounded,
                  color: Colors.yellow,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '25°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '10°C',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        if (!lastDay)
          const Divider(
            color: Color.fromARGB(40, 255, 255, 255),
            height: 40,
          )
      ],
    );
  }
}
