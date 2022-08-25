import 'package:ecommerce/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Product description matches the defined text',
    () {
      const description = 'This is a test description';
      const name = 'Product';
      final product = Product(
        name: name,
        description: description,
        price: 12.30,
        imageUrl: 'imageUrl',
      );
      expect(product.description, description);
      expect(product.name, name);
    },
  );

  group('Price', () {
    test('Price is correct', () {
      const price = 12.99;
      final product = Product(
          name: 'Product',
          description: 'this is a test description',
          price: price,
          imageUrl: 'imageUrl',);
      expect(product.price, price);
    });
    test('Price with tax is correct', () {
      const price = 12.99;
      final product = Product(
          name: 'Product',
          description: 'this is a test description',
          price: price,
          imageUrl: 'imageUrl',);
      expect(product.priceWithTax, price * 1.2);
    });
  });
}
