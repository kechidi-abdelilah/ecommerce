import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:ecommerce/network/Auth/fire_store_user.dart';
import 'package:ecommerce/network/Auth/user_storage_data.dart';
import 'package:ecommerce/network/models/user_model.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';





class WaitingControoler extends GetxController{
  late Rx<User?> user;
  UserStorageData userStorageData = Get.find();
  FireStoreUser fireStoreUser = Get.find();
  AuthController authController = Get.find();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
     user = authController.user ;
     var currentuser =
      await fireStoreUser.getCurrentUser(user.value!.uid);
      await userStorageData.setUser(UserModel(
          currentuser["userId"], currentuser["email"], currentuser["name"],
          currentuser["picture"]));
      Get.toNamed(Routes.initial);
    }
  }



