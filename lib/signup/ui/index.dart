import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/helper.dart';
import '../../pages/login/CustomTextInput.dart';

class SignUpPage extends GetView<AuthController> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final name= TextEditingController();
  final phoneNumber = TextEditingController();
  final adress= TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List images = [
      "g.png",
      "t.png",
      "f.png",
    ];

    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: Helper.getTheme(context).headline6,
                  ),
                  Spacer(),
                  Text("Add your details to sign up"),
                  Spacer(),
                  CustomTextInput(hintText: "Name",obsu: false,controller:name),
                  Spacer(),
                  CustomTextInput(hintText: "Email",obsu: false,controller: email),
                  Spacer(),
                  CustomTextInput(hintText: "Phone number",obsu: false,controller: phoneNumber,),
                  Spacer(),
                  CustomTextInput(hintText: "Adresse",obsu: false,controller: adress,),
                  Spacer(),
                  CustomTextInput(hintText: "Password",obsu: true,controller: password,),
                  Spacer(),
                  CustomTextInput(hintText: "Confirm password",obsu: true,controller: confirmpassword,),
                  Spacer(),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {controller.Register(email.text.trim(), password.text.trim(), confirmpassword.text.trim());},
                        child: Text("Sign up"),
                      )),
                  Spacer(),
                  GestureDetector(


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: AppColor.orange, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
