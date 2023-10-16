import 'package:flutter/material.dart';
import 'package:news_app/Constants/enums.dart';
import 'package:news_app/Screen/Page/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final screens = [
    Stories(story: STORY.EVERYTHING,),
    Stories(story: STORY.TOP_HEADLINES,),
    Stories(story: STORY.SAVED,)
  ];

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
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )),
        child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 1),
            selectedIndex: _index,
            onDestinationSelected: (index) {
              setState(() {
                _index = index;
              });
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.all_inclusive_outlined), label: 'All'),
              NavigationDestination(
                  icon: Icon(Icons.trending_up), label: 'Trending',),
              NavigationDestination(
                  icon: Icon(Icons.person), label: 'Profile',),
            ]),
      ),
    );
  }
}
