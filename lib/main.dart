import 'package:flutter/material.dart';
import 'package:news_app/Database/database_helper.dart';
import 'package:news_app/Screen/Page/home_page.dart';
import 'package:news_app/locator.dart';

// final databaseHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<DatabaseHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
