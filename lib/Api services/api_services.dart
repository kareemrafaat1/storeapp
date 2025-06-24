// Repository class
import 'package:dio/dio.dart';

class GroceryRepository {
  final Dio _dio;

  GroceryRepository(Dio dio) : _dio = dio {
    _dio.options.baseUrl = 'https://fakestoreapi.com';
  }

  Future<List<Product>> getGroceryProducts() async {
    try {
      final response = await _dio.get(
        'https://fakestoreapi.com/products',
      );
      
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}

// Product model
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}