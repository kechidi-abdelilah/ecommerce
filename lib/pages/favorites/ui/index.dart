import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GestureDetector(onTap: (){AuthController.instance.SignOut();},child: Center(child: Text("sign out"),)));
  }
}