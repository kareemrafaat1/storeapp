import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  final List<String> routeNames = [
    '/home',
    
    '/cart',
    '/favourite',
    '/explore',
    '/account',
    '/settings'
  ];

  void _onItemTapped(int index) {
    if (ModalRoute.of(context)!.settings.name != routeNames[index]) {
      Navigator.pushNamed(context, routeNames[index]);
    }
    setState(() {
      selectedIndex = index;
    });
  }

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
  buildNavItem(Icons.store, 'Shop', 0, screenWidth),
  buildNavItem(Icons.shopping_cart, 'Cart', 1, screenWidth),
  buildNavItem(Icons.favorite, 'Favourite', 2, screenWidth),
  buildNavItem(Icons.explore, 'Explore', 3, screenWidth),
  buildNavItem(Icons.person, 'Account', 4, screenWidth),
],

      ),
    );
  }

  Widget buildNavItem(
      IconData icon, String label, int index, double screenWidth) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
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
      ),
    );
  }
}
