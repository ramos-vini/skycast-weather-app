import 'package:flutter/material.dart';
import 'package:app/widgets/timeframe_selector.dart';
import 'package:app/data/app_colors.dart';
import 'package:app/managers/screen_manager.dart';
import 'package:app/widgets/home_drawer.dart';
import 'package:app/screens/search_city_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentTimeframe = 'today';

  void setTimeframe(String timeframe) {
    setState(() {
      currentTimeframe = timeframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          '{San Francisco}',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchCityScreen(),
                );
              },
              icon: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      drawer: const HomeDrawer(),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.blue),
        child: Column(
          children: [
            TimeframeSelector(
                currentTimeframe: currentTimeframe, setTimeframe: setTimeframe),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/home_background.png'),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: ScreenManager.getScreenByTimeframe(currentTimeframe)),
            )
          ],
        ),
      ),
    );
  }
}
