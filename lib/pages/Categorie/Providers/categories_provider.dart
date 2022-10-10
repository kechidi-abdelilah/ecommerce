import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../network/models/product_model.dart';
class CategoriesProvider extends GetConnect  {
  static var client = http.Client();
  @override
  void onInit() {
    String a = "\$";
    super.onInit();

  }
  Future<List<Product>> fetchProducts(String category_name) async {
    var url = Uri.https('fakestoreapi.com',
        '/products/category/jewelery');
    var response = await http.get(url);

    if (response.statusCode!=200) {
      return Future.error(response.statusCode);
    } else {
      return productModelFromJson(response.body.toString());
    }}

  Future<Product?> getProducts(int id) async {
    final response = await get('products/$id');
    return response.body;
  }

  Future<Response<Product>> postProducts(Product products) async =>
      await post('products', products);
  Future<Response> deleteProducts(int id) async => await delete('products/$id');
}
