import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      return null;
    }
  }

  setUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<UserModel> getUserData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = await prefs.getString('user');
    return await  UserModel.fromJson(jsonDecode(value!));
  }
  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

  }
}
