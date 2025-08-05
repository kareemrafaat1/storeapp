import 'package:flutter/material.dart';
import 'package:my_app/core/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: AppRouter.routes,
    );
  }
}
