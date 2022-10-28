import 'package:ecommerce/network/Auth/user_storage_data.dart';
import 'package:ecommerce/pages/Categorie/Controllers/categories_controller.dart';
import 'package:ecommerce/pages/home/controllers/data_controller.dart';
import 'package:ecommerce/pages/home/controllers/recent_products_controller.dart';
import 'package:ecommerce/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:ecommerce/signup/controller/profile_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecentProductController());
    Get.lazyPut(() => BottomNavigatorController());
    Get.lazyPut(() => CategoriesProductController());
    Get.lazyPut(() => DataController());
    Get.lazyPut(() => UserStorageData());
    Get.lazyPut(() => ProfileController());



  }
}
