import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/cart/model/cart_notifier.dart';
import 'package:my_app/features/favourite/screens/provider/favourite_notifier.dart';
import 'package:my_app/models/product_model.dart';

class ProductDetailsPage extends ConsumerWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite =
        ref.watch(favouriteProvider).any((p) => p.id == product.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
            onPressed: () {
              final productName = product.name;
              ref.read(favouriteProvider.notifier).toggleFavourite(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavourite
                      ? '$productName added to favourites ❤️'
                      : '$productName removed from favourites 💔'),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 180,
                child: product.imageUrl.startsWith('http')
                    ? Image.network(product.imageUrl)
                    : Image.asset(product.imageUrl),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('\${product.name} added to cart ✅')),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
