import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'package:my_app/features/auth/screens/login_page.dart';
import 'package:my_app/first_page.dart'; // FirstPage الحقيقي بتاعك
import 'package:my_app/core/app_router.dart'; // علشان باقي الروتز لو محتاجها

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes, // لو عندك روتز تانية (explore/cart/..)
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          // لو فيه يوزر → خش FirstPage
          if (snap.hasData) return const FirstPage();
          // لو مفيش → روح Login
          return const LoginPage();
        },
      ),
    );
  }
}
