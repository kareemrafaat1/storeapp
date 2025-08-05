class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';

    if (json['images'] != null &&
        json['images'] is List &&
        json['images'].isNotEmpty) {
      imageUrl = json['images'][0]; // أول صورة من القائمة
    } else if (json['thumbnail'] != null) {
      imageUrl = json['thumbnail']; // صورة مصغرة
    } else {
      imageUrl = 'https://via.placeholder.com/150'; // صورة افتراضية
    }

    return Product(
      id: json['id'].toString(),
      name: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'No description',
      price: (json['price'] as num).toDouble(),
      imageUrl: imageUrl,
      category: json['category'] ?? 'Uncategorized',
    );
  }
}
