import 'package:flutter/material.dart';
import 'package:my_app/Screens/on_boarding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Grocery App',
      home: OnBoarding(),
    );
  }
}
