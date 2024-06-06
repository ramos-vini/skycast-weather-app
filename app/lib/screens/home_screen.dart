import 'package:flutter/material.dart';
import 'package:app/widgets/timeframe_selector.dart';
import 'package:app/screens/day_screen.dart';
import 'package:app/data/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: DayScreen must receive a timeframe parameter ('today' || 'tomorrow')
  Widget currentTimeframe = const DayScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded, color: Colors.white)),
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
        decoration: const BoxDecoration(color: AppColors.blue),
        child: Column(
          children: [
            const TimeframeSelector(),
            Expanded(
              child: Container(
                  // Background Image
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/home_background.png'),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: currentTimeframe),
            )
          ],
        ),
      ),
    );
  }
}
