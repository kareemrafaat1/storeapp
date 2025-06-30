import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavItem(Icons.store, 'Shop', true, screenWidth),
          buildNavItem(Icons.explore, 'Explore', false, screenWidth),
          buildNavItem(Icons.shopping_cart, 'Cart', false, screenWidth),
          buildNavItem(Icons.favorite, 'Favourite', false, screenWidth),
          buildNavItem(Icons.person, 'Account', false, screenWidth),
          buildNavItem(Icons.settings, 'Settings', false, screenWidth),
        ]
      ),
    );
  }

  Widget buildNavItem(
      IconData icon, String label, bool isActive, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF53B175) : Colors.grey,
          size: screenWidth * 0.06,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.025,
            color: isActive ? const Color(0xFF53B175) : Colors.grey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
