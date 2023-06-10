import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krishna_electronics/models/user_model.dart';

class FirestoreController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future uploadUserDetails({required UserModel userModel}) async {
    await firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }
}
