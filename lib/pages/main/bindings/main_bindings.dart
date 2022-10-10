import 'package:ecommerce/pages/Categorie/Controllers/categories_controller.dart';
import 'package:ecommerce/pages/home/controllers/recent_products_controller.dart';
import 'package:ecommerce/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecentProductController());
    Get.lazyPut(() => BottomNavigatorController());
    Get.lazyPut(() => CategoriesProductController());

  }
}
