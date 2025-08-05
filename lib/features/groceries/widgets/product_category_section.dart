import 'package:flutter/material.dart';
import 'package:my_app/features/groceries/widgets/production_section.dart';
import 'package:my_app/services/api_services.dart';
import 'package:my_app/models/product_model.dart';

class ProductCategorySection extends StatelessWidget {
  final String category;
  final String title;
  final ApiService apiService;
  final bool Function(Product?)? filter;

  const ProductCategorySection({
    super.key,
    required this.category,
    required this.title,
    required this.apiService,
    this.filter,
  });

 @override
Widget build(BuildContext context) {
  return FutureBuilder<List<Product>>(
    future: apiService.fetchProductsByCategory(category),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      final products = snapshot.data!;
      return ProductionSection(
        title: title,
        products: products,
      );
    },
  );
}
}