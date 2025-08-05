// lib/features/favourite/provider/favourite_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/product_model.dart';
class FavouriteNotifier extends StateNotifier<List<Product>> {
  FavouriteNotifier() : super([]);

  void toggleFavourite(Product product) {
    if (state.contains(product)) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isFavourite(Product product) {
    return state.any((item) => item.id == product.id);
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, List<Product>>(
  (ref) => FavouriteNotifier(),
);
