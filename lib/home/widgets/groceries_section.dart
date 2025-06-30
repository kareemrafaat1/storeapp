import 'package:flutter/material.dart';
import 'package:my_app/home/model/prodect_model.dart';
import 'package:my_app/home/widgets/category_chips_list.dart';
import 'package:my_app/home/widgets/produect_section.dart';
import 'package:my_app/home/widgets/section_header.dart';

class GroceriesSection extends StatelessWidget {
  const GroceriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Groceries'),
        const SizedBox(height: 16),
        const CategoryChips(),
        const SizedBox(height: 16),
        ProductSection(
          title: 'Meat & Fish',
          products: getGroceryProducts(),
        ),
      ],
    );
  }

  List<Product> getGroceryProducts() {
    return [
      Product(
        id: '5',
        name: 'Beef Bone',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🥩',
        category: 'meat',
      ),
      Product(
        id: '6',
        name: 'Broiler Chicken',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🍗',
        category: 'meat',
      ),
      Product(
        id: '5',
        name: 'Beef Bone',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🥩',
        category: 'meat',
      ),
      Product(
        id: '6',
        name: 'Broiler Chicken',
        description: '1kg, Priceg',
        price: 4.99,
        imageUrl: '🍗',
        category: 'meat',
      ),
    ];
  }
}
