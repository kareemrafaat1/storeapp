import 'package:flutter/material.dart';

// Screens
import 'package:my_app/features/auth/screens/login_page.dart';
import 'package:my_app/features/auth/screens/signup_page.dart';
import 'package:my_app/features/cart/screens/cart_page.dart';
import 'package:my_app/features/explore/explore_page.dart';
import 'package:my_app/features/favourite/screens/favourite_page.dart';
import 'package:my_app/features/account/screens/account_page.dart';
import 'package:my_app/features/splash/screens/splash_screen.dart';
import 'package:my_app/first_page.dart';
import 'package:my_app/home_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SplashView(),
      '/first': (context) =>  const MyHomePage(),
    '/login': (context) => const LoginPage(),
    '/signup': (context) => const SignupPage(),
    '/home': (context) =>  const FirstPage(),         // ⬅️ استبدال MyHomePage بـ FirstPage لو هي الأساسية
    '/explore' : (context) => const ExplorePage(),
    '/account': (context) => const AccountPage(),
    '/cart': (context) => const CartPage(),
    '/favourite': (context) => const FavouritePage(),
  };
}
