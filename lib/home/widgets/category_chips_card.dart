import 'package:flutter/material.dart';
import 'package:my_app/home/model/grocery_category_model.dart';

class CategoryChip extends StatelessWidget {
  final GroceryCategory category;

  const CategoryChip({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.40,
      decoration: BoxDecoration(
        color: const Color(0xFF53B175).withAlpha(50),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF53B175).withAlpha(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imageUrl,
            width: screenWidth * 0.1,
            height: screenWidth * 0.09,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Text(
            category.name,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
