import 'package:flutter/material.dart';
import 'package:my_app/Models/product_model.dart';
import 'package:my_app/widgets/category_chips_list.dart';
import 'package:my_app/widgets/production_section.dart';
import 'package:my_app/widgets/section_header.dart';
import 'package:my_app/Models/grocery_category_model.dart';
import 'package:my_app/Models/api_sevices.dart';



class GroceriesSection extends StatefulWidget {
  const GroceriesSection({super.key});

  @override
  State<GroceriesSection> createState() => _GroceriesSectionState();
}

class _GroceriesSectionState extends State<GroceriesSection> {
  final ApiService apiService = ApiService();
  late Future<List<GroceryCategoryModel>> _categoriesFuture;
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = apiService.fetchCategories();
    _productsFuture = apiService.fetchProductsByCategory('groceries');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Groceries'),
        const SizedBox(height: 8.0),
        FutureBuilder<List<GroceryCategoryModel>>(
          future: _categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CategoryChipsList(categories: snapshot.data!);
          },
        ),
        FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return ProductionSection(
              title: 'Popular Products',
              products: snapshot.data!,
            );
          },
        ),
      ],
    );
  }
}