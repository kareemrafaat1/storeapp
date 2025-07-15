// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/product_model.dart';
import 'package:my_app/Models/grocery_category_model.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/category/$category'));
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> productJsonList = data['products'];
      return productJsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load $category products');
    }
  }

  // For categories (since dummyjson.com doesn't have categories endpoint)
  Future<List<GroceryCategoryModel>> fetchCategories() async {
    // This is mock data - replace with real API call when you have backend
    return [
      GroceryCategoryModel(id: '1', name: 'Groceries', imageUrl: "assets/images/groceries.png"),
      GroceryCategoryModel(id: '2', name: 'Beverages', imageUrl: "assets/images/beverages.png"),
      GroceryCategoryModel(id: '3', name: 'Fruits', imageUrl: "assets/images/fruits.png"),
    ];
  }
}