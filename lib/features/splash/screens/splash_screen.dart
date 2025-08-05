import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // بعد ثانيتين روح لـ MyHomePage
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/first');
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text(
        'Nectar',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),

       
      ),
    );
  }
}
