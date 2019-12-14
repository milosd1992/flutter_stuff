import 'package:flutter/material.dart';
import 'package:quizstar/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sports Trivia",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: splashscreen(),
    );
  }
}