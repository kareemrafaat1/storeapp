// lib/services/api_services.dart

import 'package:dio/dio.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/models/grocery_category_model.dart';
/// Service responsible for fetching grocery data from the web API.
class ApiService {
  /// Dio instance used for HTTP requests.
  final Dio _dio;

  /// Base URL for the products endpoint.
  final String baseUrl;

  ApiService({Dio? dio, this.baseUrl = 'https://dummyjson.com/products'})
      : _dio = dio ?? Dio();

  /// Fetches all products available in the store.
  Future<List<Product>> fetchAllProducts() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      }
      throw Exception('Failed to load products');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  /// Fetches products belonging to a specific category.
  Future<List<Product>> fetchProductsByCategory(String category) async {
    try {
      final response = await _dio.get('$baseUrl/category/$category');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      }
      throw Exception('Failed to load category products');
    } catch (e) {
      throw Exception('Failed to load category products: $e');
    }
  }

  /// Searches products by keyword query.
  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _dio.get('$baseUrl/search', queryParameters: {
        'q': query,
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      }
      throw Exception('Search failed');
    } catch (e) {
      throw Exception('Search failed: $e');
    }
  }

  /// Returns a mock list of grocery categories for filtering.
  Future<List<GroceryCategoryModel>> fetchMockCategories() async {
    return [
      GroceryCategoryModel(
        id: 'groceries',
        name: 'Groceries',
        imageUrl: 'assets/images/groceries.png',
      ),
      GroceryCategoryModel(
        id: 'beverages',
        name: 'Beverages',
        imageUrl: 'assets/images/beverages.png',
      ),
      GroceryCategoryModel(
        id: 'fruits',
        name: 'Fruits',
        imageUrl: 'assets/images/fruits.png',
      ),
      GroceryCategoryModel(
        id: 'snacks',
        name: 'Snacks',
        imageUrl: 'assets/images/snacks.png',
      ),
    ];
  }
}
