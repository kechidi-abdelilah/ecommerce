import 'package:ecommerce/pages/reset_password/controller/ResetPasswordController.dart';
import 'package:get/get.dart';

class ResetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResetPasswordController());
  }

}