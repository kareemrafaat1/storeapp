import 'package:flutter/material.dart';
import 'package:my_app/Models/grocery_category_model.dart';
import 'package:my_app/widgets/category_chips_card.dart';

class CategoryChipsList extends StatelessWidget {
  final List<GroceryCategoryModel> categories;
  final Function(String)? onCategorySelected; // Optional callback for category selection

  const CategoryChipsList({
    Key? key,
    required this.categories,
    this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              left: 8.0,
              right: index < categories.length - 1 ? 16 : 8.0,
            ),
            child: GestureDetector(
              onTap: () {
                if (onCategorySelected != null) {
                  onCategorySelected!(category.id);
                }
              },
              child: CategoryChipsCard(
                category: category,
                // You can add selection logic if needed
              ),
            ),
          );
        },
      ),
    );
  }
}