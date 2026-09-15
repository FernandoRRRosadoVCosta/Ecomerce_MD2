class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String brand;
  final String category;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      brand: json['brand'],
      category: json['category'],
    );
  }
}
