import 'package:get/get.dart';

import '../../../network/models/product_model.dart';
import '../providers/products_provider.dart';
class RecentProductController extends GetxController with StateMixin <List<Product>> {
  //TODO: Implement ProductsController
  ProductsProvider productsProvider = ProductsProvider();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    productsProvider.fetchProducts().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null,status: RxStatus.error(err.toString()));
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