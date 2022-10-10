import 'package:ecommerce/network/models/product_model.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:ecommerce/pages/home/data/shoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/providers/products_provider.dart';

class SearchController extends GetxController {

  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController(text: '');
  RxString search = ''.obs;
  ProductsProvider productsProvider = ProductsProvider();
  RxList<Product>? searchedproducts=<Product>[].obs;


  void onSearch() async {
    searchedproducts!.clear();
    isLoading.value = true;
    List<Product> all = await productsProvider.fetchProducts() ;

    await Future.delayed(
      const Duration(seconds: 2),
    );
    search.value = searchController.text;
    if (search.isNotEmpty) {
      for (Product product in all) {
        product.title!.contains(search) ? searchedproducts!.add(product) : null;
      }
    }
    if (search.isEmpty) {
      searchedproducts= <Product>[].obs;
    }
    isLoading.value = false;
  }
}
