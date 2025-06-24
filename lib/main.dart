import 'package:flutter/material.dart';
import 'package:my_app/Widgets/splach_screen.dart';
import 'Screens/login_page.dart';
import 'Screens/signup_page.dart';
import 'Screens/first_page.dart';
import 'Screens/account_page.dart';
import 'Screens/bevarges_page.dart';
import 'Screens/explore_page.dart';
import 'Screens/favourite_page.dart';
import 'Screens/cart_page.dart';
import 'Screens/home_page.dart';





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
      // home: const SplashScreen(),  // Use SplashScreen as the initial screen
      // initialRoute: '/',  // Set your initial route
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
        '/home_page': (context) => const FirstPage(), 
        // Assuming you want to use FirstPage as the splash screen
         // Assuming FirstPage is your home
      },
    );
  }
}