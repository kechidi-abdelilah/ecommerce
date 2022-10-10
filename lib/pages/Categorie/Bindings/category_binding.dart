import 'package:ecommerce/pages/home/controllers/recent_products_controller.dart';
import 'package:ecommerce/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:get/get.dart';

import '../Controllers/categories_controller.dart';

class CategorieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesProductController());
    Get.lazyPut(() => BottomNavigatorController());
  }
}