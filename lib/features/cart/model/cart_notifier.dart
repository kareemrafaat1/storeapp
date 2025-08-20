import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/product_model.dart';
class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (!state.any((item) => item.id == product.id)) {
      state = [...state, product];
    }
  }

/*************  ✨ Windsurf Command ⭐  *************/
/// Removes a product from the cart.
/// If the product is not present in the cart, the cart remains unchanged.
/// 
/// @param product The product to be removed from the cart.

/// *****  3a9501de-b873-431e-8963-7f98f8f3f6f5  ******
  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }

/*************  ✨ Windsurf Command ⭐  *************/
/// Checks if a product is present in the cart.
/// 
/// @param product The product to check for presence in the cart.
/// @return True if the product is in the cart, false otherwise.

/// *****  ecb95c0d-e6b8-4e37-8527-5baa8908abb7  ******
  bool isInCart(Product product) {
    return state.any((item) => item.id == product.id);
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);
