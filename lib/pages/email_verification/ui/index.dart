import 'package:ecommerce/pages/email_verification/controller/email_veridication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationPage extends GetView<EmailVerificationController>{
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () { controller.EmailVerify(Get.arguments); },
          child: Text('please verify your email'),
        ),
      ),
    );
  }
}
