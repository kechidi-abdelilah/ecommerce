import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollecton =
  FirebaseFirestore.instance.collection('User');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollecton.doc(userModel.userId).set(userModel.toJson());
  }
  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _userCollecton.doc(uid).get();
  }
  Future updatedata(UserModel userModel)async{
    var collection = FirebaseFirestore.instance.collection('User');
    collection
        .doc('${userModel.userId}') // <-- Doc ID where data should be updated.
        .update(userModel.toJson());
  }
}