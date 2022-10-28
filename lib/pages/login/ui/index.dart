
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/helper.dart';
import '../../../network/Auth/auth_controller.dart';
import '../CustomTextInput.dart';


class LoginPage extends GetView<AuthController> {
  static const routeName = "/loginScreen";
  final email = TextEditingController();
  final password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: Helper.getTheme(context).headline6,
                  ),
                  Spacer(),
                  Text("Add your details to login"),
                  Spacer(),
                  CustomTextInput(
                    hintText: "Your email",
                    obsu: false,
                    controller: email,
                  ),
                  Spacer(),
                  CustomTextInput(
                    hintText: "Password",
                    obsu: true,
                    controller: password,

                  ),
                  Spacer(),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child:
                      ElevatedButton(onPressed: () { controller.SignIn(email.text.trim(), password.text.trim());}, child: Text("Login"))),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.forgetpassword);
                    },
                    child: Text("Forget your password?"),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text("Or login with"),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0XFF367FC0))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            Helper.getAssetName("f.png", "virtual"),
                          ),
                          Text("Login with Facebook")
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0XFFDD4B39))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            Helper.getAssetName("google.png", "virtual"),
                          ),
                          Text("Login with Google")
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap:(){ Get.toNamed(Routes.signup);},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColor.orange, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
