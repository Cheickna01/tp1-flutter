import 'package:flutter/material.dart';
import 'package:my_first_app/pages/chat.page.dart';
import 'package:my_first_app/pages/counter.page.dart';
import 'package:my_first_app/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),
        "/counter": (context) => CounterPage(),
        "/chat": (context) => ChatPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
          secondary: Colors.teal,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 44),
          bodySmall: TextStyle(fontSize: 18),
        ),
        indicatorColor: Colors.white,
      ),
    );
  }
}
