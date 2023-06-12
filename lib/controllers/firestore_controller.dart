import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/front_page_banner_model.dart';
import '../models/user_model.dart';

class FirestoreController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future uploadUserDetails({required UserModel userModel}) async {
    await firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    var categoriesSnapshot = await firestore.collection('categories').get();
    for (int i = 0; i < categoriesSnapshot.docs.length; i++) {
      CategoryModel categoryModel =
          CategoryModel.fromSnap(categoriesSnapshot.docs[i]);
      categories.add(categoryModel);
    }
    return categories;
  }

  // for test
  Future uploadByAdminRights(
      {required FrontPageBannerModel frontPageBannerModel,
      required String adType}) async {
    try {
      await firestore
          .collection(adType)
          .doc('${adType}_${frontPageBannerModel.productId}')
          .set(frontPageBannerModel.toJson());
    } catch (e) {
      log(
        'Catch block in FirestoreController().adminRights(), ${e.toString()}',
      );
    }
  }
}
