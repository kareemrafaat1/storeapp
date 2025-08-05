import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/services/api_services.dart';
import 'package:my_app/core/widgets/section_header.dart';
import 'package:my_app/features/groceries/widgets/production_section.dart';

class GroceriesSection extends StatefulWidget {
  const GroceriesSection({super.key});

  @override
  State<GroceriesSection> createState() => _GroceriesSectionState();
}

class _GroceriesSectionState extends State<GroceriesSection> {
  final ApiService apiService = ApiService();
  late Future<List<Product>> _groceryFuture;

  @override
  void initState() {
    super.initState();
    _groceryFuture = _loadGroceries();
  }

  Future<List<Product>> _loadGroceries() async {
    final all = await apiService.fetchAllProducts();
    return Future.value(all
        .where((p) => p.category.toLowerCase() == 'groceries')
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Groceries'),
        const SizedBox(height: 8),
        FutureBuilder<List<Product>>(
          future: _groceryFuture,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text('Error: ${snap.error}'));
            }
            final products = snap.data!;
            if (products.isEmpty) {
              return const Center(child: Text('No grocery items found'));
            }
            return ProductionSection(
              title: 'Popular Groceries',
              products: products,
            );
          },
        ),
      ],
    );
  }
}
