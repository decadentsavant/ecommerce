import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';

class Order {
  Order({
    required this.confirmationId,
    required this.timestamp,
    required this.products,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      confirmationId: map['confirmationId'] as String,
      timestamp: map['timestamp'] as Timestamp,
      products: (map['products'] as List<dynamic>)
          .map((product) => Product.fromMap(product as Map<String, dynamic>))
          .toList(),
    );
  }
  String confirmationId;
  Timestamp timestamp;
  List<Product> products;
}
