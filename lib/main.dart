
import 'package:flutter/material.dart';
import 'package:my_app/first_page.dart';
import 'package:dio/dio.dart';
 



void main() async{

final dio = Dio();


  final response = await dio.get('https://dummyjson.com/products/category/groceries');

  print(response);
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
      home:  FirstPage(),
    );
  }
}