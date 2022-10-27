import 'package:ecommerce/pages/reset_password/controller/ResetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../signup/controller/profile_controller.dart';
import '../../profile/ui/index.dart';

class ResetPaswwordPage extends GetView<ResetPasswordController>{
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  bool _isObscureCode = true;
  bool _isObscureP = true;
  bool _isObscureC = true;

  @override
  Widget build(BuildContext context) {

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
            Text("change Password",
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
              "Current Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 70,
              child: TextFormField(
                controller: currentPassword,
                obscureText: _isObscureCode,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  helperText: "Enter your current password ",
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
              "New password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 70,
              child: TextFormField(
                controller: newPassword,
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
                      onPressed: () {/*
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
                controller: confirmPassword,
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
                onPressed: () {controller.changePassword(currentPassword.text.trim(), newPassword.text.trim(), confirmPassword.text.trim());},
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
