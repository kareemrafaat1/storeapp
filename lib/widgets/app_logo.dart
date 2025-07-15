import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 50.0
  
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Vector.png',
      width: size,
      height: size,
    );
  }
}