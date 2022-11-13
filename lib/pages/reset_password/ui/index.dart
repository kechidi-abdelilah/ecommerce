import 'package:ecommerce/pages/reset_password/controller/ResetPasswordController.dart';
import 'package:ecommerce/pages/reset_password/ui/CustomTextInputR.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../login/CustomTextInput.dart';
import '../../profile/ui/index.dart';

class ResetPaswwordPage extends GetView<ResetPasswordController> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 22,
            ),
            Text("Change Password",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text(
              "Your new password must be different from previous used password",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 8,
            ),
            CustomTextInputR(
              inputType: TextInputType.text,
              hintText: "current password",
              obsu: true,
              controller: currentPassword,
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 8,
            ),
            CustomTextInputR(
              inputType: TextInputType.text,
              hintText: "new password",
              obsu: true,
              controller: newPassword,
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 8,
            ),
            CustomTextInputR(
              inputType: TextInputType.text,
              hintText: "confirm password",
              obsu: true,
              controller: confirmPassword,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  controller.changePassword(currentPassword.text.trim(),
                      newPassword.text.trim(), confirmPassword.text.trim());
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
