import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/product_model.dart';
class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (!state.any((item) => item.id == product.id)) {
      state = [...state, product];
    }
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }

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
