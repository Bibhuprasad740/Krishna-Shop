import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/user_model.dart';

class FirestoreController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future uploadUserDetails({required UserModel userModel}) async {
    await firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCategories() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> categories = [];
    var categoriesSnapshot = await firestore.collection('categories').get();
    categories = categoriesSnapshot.docs;
    return categories;
  }

  // for test
  Future uploadByAdminRights({required CategoryModel categoryModel}) async {
    try {
      await firestore
          .collection('categories')
          .doc(categoryModel.categoryName)
          .set(categoryModel.toJson());
    } catch (e) {
      log(
        'Catch block in FirestoreController().adminRights(), ${e.toString()}',
      );
    }
  }
}
