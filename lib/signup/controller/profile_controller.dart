 import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/network/Auth/fire_store_user.dart';
import 'package:ecommerce/network/Auth/user_storage_data.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../network/models/user_model.dart';
 import 'package:firebase_storage/firebase_storage.dart' ;


class ProfileController extends GetxController {



  final UserStorageData userStorageData = Get.find();
  Rx<UserModel> userModel= UserModel("", "", "", "").obs;

  RxInt count=0.obs;
  late PlatformFile pickedFile;
  late UploadTask uploadTask;
@override
  void onInit() {
  getcurrentUser();
  userModel.stream;

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady


  }


  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    userStorageData.deleteUser();
    Get.offAll(Routes.login);
  }


  void getcurrentUser()async{
    await userStorageData.getUser.then((value) {
      print("hello ${value!.email}");
      userModel.value=value;
      print("hello 2 ${userModel.value.email}");
    });
    update();
  }
  Future selectFile()async{
    final result = await FilePicker.platform.pickFiles();
    if (result==Null){
      return;
    }
    pickedFile = result!.files.first;
    uploadFile();
  }
  Future uploadFile()async {
    final path = 'images/${pickedFile.name}';
    final file= File(pickedFile.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask =ref.putFile(file);
    final snapshot =await  uploadTask.whenComplete((){});
    final downloadurl = await snapshot.ref.getDownloadURL();
    userModel.value.picture = downloadurl;
    userModel.refresh();


    await FireStoreUser().updatedata(userModel.value);
    await userStorageData.setUser(userModel.value);
    Get.snackbar("sucees", "done");


  }


}