import 'package:flutter/material.dart';

class DayConditions extends StatefulWidget {
  const DayConditions({super.key});

  @override
  State<DayConditions> createState() => _DayConditionsState();
}

class _DayConditionsState extends State<DayConditions> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(Icons.cloud_outlined, color: Colors.white, size: 30,),
            SizedBox(width: 6),
            Text('75%', style: TextStyle(color: Colors.white, fontSize: 18),)
          ],
        ),
        Row(
          children: [
            Icon(Icons.air_outlined, color: Colors.white, size: 30,),
            SizedBox(width: 6),
            Text('3.1 m/s', style: TextStyle(color: Colors.white, fontSize: 18,),)
          ],
        ),
        Row(
          children: [
            Icon(Icons.water_drop_outlined, color: Colors.white, size: 30,),
            SizedBox(width: 6),
            Text('86%', style: TextStyle(color: Colors.white, fontSize: 18),)
          ],
        )
      ],
    );
  }
}
