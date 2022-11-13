
import 'package:get/get.dart';

import '../signup/controller/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());

  }
}