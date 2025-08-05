import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/details/product_details.dart';
import 'package:my_app/features/cart/model/cart_notifier.dart';
import 'package:my_app/features/favourite/screens/provider/favourite_notifier.dart';
import 'package:my_app/features/groceries/widgets/add_to_card.dart';
import 'package:my_app/models/product_model.dart';
class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42, // الحجم المناسب

        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(8),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 72,
                width: 72,
                child: product.imageUrl.startsWith('http')
                    ? Image.network(product.imageUrl, fit: BoxFit.contain)
                    : Image.asset(product.imageUrl, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: Colors.grey[500],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        ref.watch(favouriteProvider).any((p) => p.id == product.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                     
                      onPressed: () {
                        ref.read(favouriteProvider.notifier).toggleFavourite(product);
                        final isFav = ref.read(favouriteProvider).any((p) => p.id == product.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFav
                                  ? '${product.name} added to favourites ❤️'
                                  : '${product.name} removed from favourites 💔',
                            ),
                          ),
                        );
                      },
                    ),
                    AddToCartButton(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.name} added to cart ✅')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
