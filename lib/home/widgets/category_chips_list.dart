import 'package:flutter/material.dart';
import 'package:my_app/home/model/grocery_category_model.dart';
import 'package:my_app/home/widgets/category_chips_card.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      GroceryCategory(
          id: '1', name: 'Pulses', imageUrl: 'assets/images/pulses.png'),
      GroceryCategory(
          id: '2', name: 'Rice', imageUrl: 'assets/images/pulses.png'),
      GroceryCategory(
          id: '3', name: 'Fruits', imageUrl: 'assets/images/pulses.png'),
      GroceryCategory(
          id: '4', name: 'Vegetables', imageUrl: 'assets/images/pulses.png'),
      GroceryCategory(
          id: '5', name: 'Meat', imageUrl: 'assets/images/pulses.png'),
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? 16 : 0,
            ),
            child: CategoryChip(category: category),
          );
        },
      ),
    );
  }
}
