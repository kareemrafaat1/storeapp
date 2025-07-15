import 'package:flutter/material.dart';
import 'package:my_app/Models/product_model.dart';
import 'package:my_app/widgets/section_header.dart';
import 'package:my_app/widgets/product_card.dart'; // Make sure this import exists and ProductCard is defined there

class ProductionSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  const ProductionSection({
    super.key,
    required this.title,
    required this.products,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < products.length - 1 ? 16 : 0,
                ),
                child: ProductCard(product: products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}