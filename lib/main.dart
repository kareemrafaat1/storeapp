import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'first_page.dart';
import 'account_page.dart';
import 'bevarges_page.dart';
import 'explore_page.dart';
import 'favourite_page.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',  // Set your initial route
      routes: {
        '/': (context) => const MyHomePage(),  // Your welcome screen
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/first_page': (context) => const FirstPage(),
        '/account_page': (context) => const AccountPage(),
        '/bevarges_page': (context) => const BevargesPage(),
        '/explore_page': (context) => const ExplorePage(),
        '/favourite_page': (context) => const FavouritePage(),
        '/cart_page': (context) => const CartPage(),
        '/home_page': (context) => const FirstPage(),  // Assuming FirstPage is your home
      },
    );
  }
}