import 'package:ecommerce/pages/forgetpassword/controller/ForgetPasswordController.dart';
import 'package:get/get.dart';

class ForgetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }

}