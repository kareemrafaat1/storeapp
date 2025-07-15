import 'package:flutter/material.dart';
import 'package:my_app/Models/api_sevices.dart';
import 'package:my_app/Models/product_model.dart';
import 'package:my_app/widgets/banner_section.dart';
import 'package:my_app/widgets/bottom_navigation_bar.dart';
import 'package:my_app/widgets/groceries_section.dart';
import 'package:my_app/widgets/location_search.dart';
import 'package:my_app/widgets/production_section.dart';


class FirstPage extends StatelessWidget {
  final ApiService apiService = ApiService();

   FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LocationSearch(),
            const SizedBox(height: 8.0),
            const BannerSection(),
            const SizedBox(height: 8.0),
            FutureBuilder<List<Product>>(
              future: apiService.fetchProductsByCategory('groceries'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return ProductionSection(
                  title: 'Exclusive Offers', 
                  products: snapshot.data!,
                );
              },
            ),
            const SizedBox(height: 8.0),
            FutureBuilder<List<Product>>(
              future: apiService.fetchProductsByCategory('beverages'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return ProductionSection(
                  title: 'Exclusive Offers', 
                  products: snapshot.data!,
                );
              },
            ),
            const SizedBox(height: 8.0),
            const GroceriesSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
