// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';

class FirestoreService {
  FirestoreService({
    required this.uid,
  });

  final String uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(
    Product product,
  ) async {
    await firestore
        .collection('products')
        .add(product.toMap())
        .then(print)
        .catchError((onError) => print('Error'));
  }

  Stream<List<Product>> getProducts() {
    return firestore.collection('products').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            final d = doc.data();
            return Product.fromMap(d);
          }).toList(),
        );
  }

  Future<void> deleteProduct(String id) async {
    return await firestore.collection('products').doc(id).delete();
  }
}
