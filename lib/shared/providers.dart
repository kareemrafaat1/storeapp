import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/services/api_services.dart';
import 'package:my_app/models/product_model.dart';


/// يوفر ApiService لكل أنحاء التطبيق
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

/// النص المكتوب في البحث (Search Bar)
final searchQueryProvider = StateProvider<String>((ref) => '');

/// نتائج البحث بناءً على النص المكتوب
final searchResultsProvider = FutureProvider<List<Product>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];
  final api = ref.watch(apiServiceProvider);
  return api.searchProducts(query);
});
