import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  void changePassword(String currentPassword, String newPassword,
      String confirmPassword) async {
    if (newPassword == confirmPassword) {
      final user = await FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
          email: user!.email.toString(), password: currentPassword);
      user.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword(newPassword).then((_) {
          Get.snackbar("", "done");
        }).catchError((error) {
          //Error, show something
        });
      }).catchError((err) {
        Get.snackbar("", "Enter a valid password and try again");
      });
    } else {
      Get.snackbar(
          "", "You must enter the same password in order to confirm it");
    }
  }
}
