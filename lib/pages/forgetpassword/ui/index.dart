import 'package:ecommerce/pages/forgetpassword/controller/ForgetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetpasswordPage extends GetView<ForgetPasswordController>{
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                controller: email,
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
