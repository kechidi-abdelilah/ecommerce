import 'package:ecommerce/network/models/user_model.dart';
import 'package:ecommerce/pages/signup/controller/profile_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../network/Auth/user_storage_data.dart';
import '../../../routes/routes.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserStorageData userStorageData = UserStorageData();
    ProfileController profileController = ProfileController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    _signOut() async {
      await _firebaseAuth.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Obx(() {
                  return CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("${controller.userModel.value.picture}"),
                    backgroundColor: Colors.transparent,
                  );
                }),
                Positioned(
                  right: -16,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: Color(0xFFF5F6F9),
                      ),
                      onPressed: () {
                        controller.selectFile();
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12),
          //       color: Colors.teal[50]),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Icon(
          //             Icons.email,
          //             color: Colors.teal,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Obx(
          //             () => Text(
          //               "${controller.userModel.value.name}",
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //           ),
          //         ],
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.arrow_forward_ios),
          //         color: Colors.teal,
          //         onPressed: null,
          //       ),
          //     ],
          //   ),
          // ),
          Spacer(),
          Container(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.resetpassword);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.lock,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Change password",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.help,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Help Center",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: InkWell(
              onTap: () {
                _signOut();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Log out",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }

  Widget ResetPassword(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        leadingWidth: 30,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.help,
              color: Colors.black,
            ),
          )
        ],
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
            Text(
              "Email adress",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    "Send instructions",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckEmailView(context)));
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CheckEmailView(context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail_outline_rounded,
                  size: 100,
                  color: Colors.teal,
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Check your email",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      "We have sent password recovery instuctions to your emai",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => newPassword(context)));
                },
                child: Text("Next"),
                style: ElevatedButton.styleFrom())
          ]),
    );
  }

  Widget newPassword(BuildContext context) {
    bool _isObscureCode = true;
    bool _isObscureP = true;
    bool _isObscureC = true;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        elevation: 0,
        title: Text(
          "back",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 22,
            ),
            Text("Create new password",
                style: TextStyle(
                    fontSize: 20,
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
            Text(
              "Confirmation Code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 70,
              child: TextFormField(
                obscureText: _isObscureCode,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  helperText: "Enter the code sent to your inbox",
                  helperStyle: TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureC ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        /*setState(() {
                          _isObscureCode = !_isObscureCode;
                        });*/
                      }),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 70,
              child: TextFormField(
                obscureText: _isObscureP,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  helperText: "must be at least 8 characters",
                  helperStyle: TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureC ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        /*
                        setState(() {
                          _isObscureP = !_isObscureP;
                        });*/
                      }),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Confirm password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 70,
              child: TextFormField(
                obscureText: _isObscureC,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  helperText: "Both passwords must match",
                  helperStyle: TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureC ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        /*setState(() {
                          _isObscureC = !_isObscureC;
                        });*/
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
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
