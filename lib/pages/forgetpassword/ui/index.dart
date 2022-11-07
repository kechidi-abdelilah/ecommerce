import 'package:ecommerce/pages/forgetpassword/controller/ForgetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class ForgetpasswordPage extends GetView<ForgetPasswordController> {
  final email = TextEditingController();
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
            Text(
              "Reset Password",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "Enter the email associated with your account and we\'ll send an email with instructions",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: ShapeDecoration(
                shape: StadiumBorder(side: BorderSide(color: Colors.teal)),
              ),
              child: TextField(
                controller: email,
                obscureText: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "email",
                    hintStyle: TextStyle(color: AppColors.main),
                    contentPadding: const EdgeInsets.only(left: 30)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      minimumSize: Size(double.infinity, 50),
                      shape: StadiumBorder()),
                  child: Text(
                    "Send instructions",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    controller.resetpassword(email.text.trim());
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
