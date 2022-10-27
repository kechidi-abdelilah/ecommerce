import 'package:ecommerce/network/Auth/user_storage_data.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import 'fire_store_user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  String userImage =
      "https://firebasestorage.googleapis.com/v0/b/auth-6394b.appspot.com/o/images%2Fimages.png?alt=media&token=174f6222-bb62-4984-a0f3-b375dfad3c67";
  UserStorageData userStorageData = UserStorageData();
  FireStoreUser fireStoreUser = FireStoreUser();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    String a ;
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());

    ever(user, _initialScreen);
  }

  _initialScreen(User? user) async {

    if (user?.email == null) {
      Get.offAllNamed(Routes.login);
    } else {
      print("${user!.emailVerified }");
      if (user.emailVerified ==false ) {
        Get.offAllNamed(Routes.emailverification,
            arguments: '${auth.currentUser!.email}');
      } else {
        Get.offAllNamed(Routes.waiting);
        print(auth.currentUser!.uid);
      }
    }
  }

  void Register(String email, String password, String username) async {
    try {
      print("register");
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await fireStoreUser.addUserToFireStore(UserModel(
          credential.user!.uid.toString(), email, username, userImage));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("weak-password", 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar("email-already-in-use",
            'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void SignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void SignOut() {
    auth.signOut();
  }

  void saveUser(UserCredential userCredential, String username) async {
    UserModel userModel = UserModel(
        userCredential.user!.uid,
        userCredential.user!.email.toString(),
        username == null
            ? userCredential.user!.displayName.toString()
            : username,
        '');
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await UserStorageData().setUser(userModel);
  }
}
