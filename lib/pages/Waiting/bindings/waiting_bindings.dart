import 'package:ecommerce/network/Auth/fire_store_user.dart';
import 'package:ecommerce/network/Auth/user_storage_data.dart';
import 'package:ecommerce/pages/Waiting/controller/waiting_controller.dart';
import 'package:get/get.dart';

class WaitingBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WaitingControoler());
    Get.lazyPut(() => UserStorageData());
    Get.lazyPut(() => FireStoreUser());

  }

}