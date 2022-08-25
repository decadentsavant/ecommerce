class Product {
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String? ?? '',
        name = map['name'] as String? ?? '',
        description = map['description'] as String? ?? '',
        price = map['price'] as double? ?? 0.0,
        imageUrl = map['imageUrl'] as String? ?? '';

  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Map<String, dynamic> toMap(String docId) {
    return {
      'id': docId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
