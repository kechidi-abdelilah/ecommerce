import 'package:ecommerce/signup/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());

  }
}