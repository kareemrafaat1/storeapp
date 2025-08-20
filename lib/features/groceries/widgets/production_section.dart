import 'package:flutter/material.dart';
import 'package:my_app/core/widgets/section_header.dart';
import 'package:my_app/features/groceries/widgets/product_card.dart';
import 'package:my_app/models/product_model.dart';
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
    return Column(
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 16),
        SizedBox(
          height: 220, 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12), 
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }
}
