import 'package:ecommerce/pages/Categorie/Providers/categories_provider.dart';
import 'package:get/get.dart';

import '../../../network/models/product_model.dart';
import '../../home/providers/products_provider.dart';

class CategoriesProductController extends GetxController
    with StateMixin<List<Product>> {
  //TODO: Implement ProductsController
  CategoriesProvider productsProvider = CategoriesProvider();
  final count = 0.obs;
  RxString categoryName = "".obs;

  @override
  void onInit() {
    super.onInit();
    productsProvider.fetchProducts(categoryName.value).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
