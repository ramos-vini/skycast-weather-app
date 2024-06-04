import 'package:flutter/material.dart';
import 'package:app/widgets/timeframe_selector.dart';
import 'package:app/screens/day_screen.dart';
// import 'package:app/screens/week_screen.dart';
import 'package:app/data/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DayScreen must receive a timeframe parameter ('today' || 'tomorrow')
  Widget currentTimeframe = const DayScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.open_in_new_rounded, color: Colors.white)),
        title: const Text(
          'Berlin',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.blue, AppColors.darkBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            const TimeframeSelector(),
            Container(
                padding: const EdgeInsets.all(20),
                color: AppColors.orange,
                child: currentTimeframe)
          ],
        ),
      ),
    );
  }
}
