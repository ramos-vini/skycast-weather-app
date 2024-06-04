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
  // TODO: DayScreen must receive a timeframe parameter ('today' || 'tomorrow')
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
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          // TODO: Use downloaded image and set color filter to it
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1544376798-89aa6b82c6cd?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWwlMjBsYW5kc2NhcGV8ZW58MHx8MHx8fDA%3D"),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.all(20),
                  //color: AppColors.orange,
                  child: currentTimeframe),
            )
          ],
        ),
      ),
    );
  }
}
