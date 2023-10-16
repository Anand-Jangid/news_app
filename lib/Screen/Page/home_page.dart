import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Connectivity/internet_connectivity.dart';
import 'package:news_app/Constants/enums.dart';
import 'package:news_app/Screen/Page/stories.dart';
import 'package:news_app/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final Connectivity connectivity = Connectivity();
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  final screens = [
    const Stories(
      story: STORY.EVERYTHING,
    ),
    const Stories(
      story: STORY.TOP_HEADLINES,
    ),
    const Stories(
      story: STORY.SAVED,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: screens[_index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )),
        child: NavigationBar(
            labelBehavior:
                NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 1),
            selectedIndex: _index,
            onDestinationSelected: (index) {
              setState(() {
                _index = index;
              });
            },
            destinations: [
              const NavigationDestination(
                  icon: Icon(Icons.all_inclusive_outlined), label: 'All'),
              const NavigationDestination(
                icon: Icon(Icons.trending_up),
                label: 'Trending',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
