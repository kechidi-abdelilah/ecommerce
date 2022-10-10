import 'dart:ffi';

import 'package:ecommerce/network/models/cart_item.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:get/get.dart';

import '../../../network/models/product_model.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxDouble total = 0.0.obs;
  void addToCart(Product product) {
    for (var item in items) {
      if (item.product.id == product.id) {
        items[items.indexOf(item)].quantity += 1;
        return;
      }
    }
    items.add(CartItem(product: product));
    calTotal();
    update();
  }

  void addQuantity(CartItem item) {
    item.quantity++;
    calTotal();
    update();
  }

  void lowQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
    calTotal();
    update();
  }

  void calTotal() {
    total.value = 0;
    for (var item in items) {
      total.value += (double.parse(item.product.price!.toString())* item.quantity);
    }
  }
}
