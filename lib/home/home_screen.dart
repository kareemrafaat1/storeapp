import 'package:flutter/material.dart';
import 'package:my_app/home/model/prodect_model.dart';
import 'package:my_app/home/widgets/banner_section.dart';
import 'package:my_app/home/widgets/bottom_navigation.dart';
import 'package:my_app/home/widgets/groceries_section.dart';
import 'package:my_app/home/widgets/location_search.dart';
import 'package:my_app/home/widgets/produect_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LocationSearchHeader(),
            const SizedBox(height: 16),
            const BannerSection(),
            const SizedBox(height: 24),
            ProductSection(
              title: 'Exclusive Offer',
              products: getExclusiveOffers(),
            ),
            const SizedBox(height: 24),
            ProductSection(
              title: 'Best Selling',
              products: getBestSelling(),
            ),
            const SizedBox(height: 24),
            const GroceriesSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  List<Product> getExclusiveOffers() {
    return [
      Product(
        id: '1',
        name: 'Organic Bananas',
        description: '7pcs, Priceg',
        price: 4.99,
        imageUrl: '🍌',
        category: 'fruits',
      ),
      Product(
        id: '2',
        name: 'Red Apple',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🍎',
        category: 'fruits',
      ),
      Product(
        id: '1',
        name: 'Organic Bananas',
        description: '7pcs, Priceg',
        price: 4.99,
        imageUrl: '🍌',
        category: 'fruits',
      ),
      Product(
        id: '2',
        name: 'Red Apple',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🍎',
        category: 'fruits',
      ),
    ];
  }

  List<Product> getBestSelling() {
    return [
      Product(
        id: '3',
        name: 'Bell Pepper Red',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🫑',
        category: 'vegetables',
      ),
      Product(
        id: '4',
        name: 'Ginger',
        description: '250gm, Priceg',
        price: 4.99,
        imageUrl: '🫚',
        category: 'vegetables',
      ),
      Product(
        id: '3',
        name: 'Bell Pepper Red',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🫑',
        category: 'vegetables',
      ),
      Product(
        id: '4',
        name: 'Ginger',
        description: '250gm, Priceg',
        price: 4.99,
        imageUrl: '🫚',
        category: 'vegetables',
      ),
    ];
  }
}
