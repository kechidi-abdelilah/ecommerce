import 'package:ecommerce/pages/email_verification/controller/email_veridication_controller.dart';
import 'package:get/get.dart';

class EmailVerificationBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EmailVerificationController());
  }

}