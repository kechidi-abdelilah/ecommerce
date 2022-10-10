import 'package:ecommerce/network/models/product_model.dart';


class CartItem {
  Product product;
  int quantity;
  CartItem({
    required this.product,
    this.quantity = 1,
  });

  @override
  String toString() => 'CartItem(shoe: ${product}, quantity: $quantity)';
}
