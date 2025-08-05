import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/cart/model/cart_notifier.dart';
import 'package:my_app/features/favourite/screens/provider/favourite_notifier.dart';
import 'package:my_app/models/product_model.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});
 



  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final favourites = ref.watch(favouriteProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TimeOfDay.now().format(context),
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: favourites.isEmpty
          ? const Center(child: Text('No favourite products yet'))
          : ListView.separated(
              itemCount: favourites.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final product = favourites[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          cartNotifier.addToCart(product as Product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.name} added to cart')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          ref.read(favouriteProvider.notifier).toggleFavourite(product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}