// import 'package:flutter/material.dart';
// import 'package:my_app/Screens/home_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate after 2 seconds (or after async tasks)
//     Future.delayed(const Duration(seconds: 2), () {
//       if (!mounted) return;
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const MyHomePage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/firstscreen.png', width: 150),
//             const SizedBox(height: 20),
//             const CircularProgressIndicator(), // Optional loader
//           ],
//         ),
//       ),
//     );
//   }
// }