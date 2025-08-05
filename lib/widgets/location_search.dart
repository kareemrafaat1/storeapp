import 'package:flutter/material.dart';
import 'package:my_app/core/widgets/app_logo.dart';
 

class LocationSearch extends StatelessWidget {
  const LocationSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: AppLogo(size: screenWidth * 0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on,
              color: Colors.blue,
               size: 16.0,),
              const SizedBox(width: 4),
              Text(
                'Dhaka,Banasree',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            width: screenWidth * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a location',
                prefixIcon: Icon(Icons.search, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
 }
