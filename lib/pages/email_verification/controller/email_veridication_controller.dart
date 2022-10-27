import 'dart:async';

import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {

  var actionCodeSettings = ActionCodeSettings(
    url: 'https://www.example.com/?email=${AuthController.instance.auth
        .currentUser!.email}',
    androidPackageName: 'com.example.shoesommercemain',
    androidInstallApp: true,
    androidMinimumVersion: '12',
    iOSBundleId: 'com.example.shoesommercemain',
    handleCodeInApp: true,
  );
  late Timer timer;

  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      print('hi ${FirebaseAuth.instance.currentUser!.emailVerified}'
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified){
        dispose();
        timer.cancel();
      }
    }, );}


    void EmailVerify(String emailAuth) async {
      await AuthController.instance.auth.currentUser!.sendEmailVerification(
          );
    }
  }