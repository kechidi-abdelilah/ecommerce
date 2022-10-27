

import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  void resetpassword (String email)async{
  try  {

  await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => Get.snackbar("", "we send an email to reset your password ")
  );
  Get.toNamed(Routes.login);


  } on FirebaseAuthException catch (e) {
    Get.snackbar("", "mknch had email yal7mar");

  print(e.code);
  print(e.message);
// show the snackbar here
  }
}}