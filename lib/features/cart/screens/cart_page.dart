import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/cart/model/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.signal_cellular_4_bar, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, height: 50),
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeFromCart(product);
                    },
                  ),
                );
              },
            ),
     bottomNavigationBar: cartItems.isEmpty
    ? null
    : Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Proceeding to checkout...')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Checkout', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 8),
            Text(
              'Total: \$${cartItems.fold<double>(0, (sum, item) => sum + item.price).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}