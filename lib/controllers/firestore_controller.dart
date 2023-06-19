import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/discount_ad_model.dart';
import '../models/front_page_banner_model.dart';
import '../models/user_model.dart';

class FirestoreController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future uploadUserDetails({required UserModel userModel}) async {
    try {
      await firestore
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toJson());
    } catch (e) {
      log('Catch block in FirestoreController.uploadUserDetails(), ${e.toString()}');
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    try {
      var categoriesSnapshot = await firestore.collection('categories').get();
      for (int i = 0; i < categoriesSnapshot.docs.length; i++) {
        CategoryModel categoryModel =
            CategoryModel.fromSnap(categoriesSnapshot.docs[i]);
        categories.add(categoryModel);
      }
    } catch (e) {
      log('Catch block in FirestoreController.getCategories(), ${e.toString()}');
    }
    return categories;
  }

  Future<List<FrontPageBannerModel>> getFrontPageBanners() async {
    List<FrontPageBannerModel> banners = [];
    try {
      var bannersSnapshot = await firestore.collection('frontPageBanner').get();
      for (int i = 0; i < bannersSnapshot.docs.length; i++) {
        FrontPageBannerModel frontPageBannerModel =
            FrontPageBannerModel.fromSnap(bannersSnapshot.docs[i]);
        banners.add(frontPageBannerModel);
      }
    } catch (e) {
      log('Catch block in FirestoreController.getFrontPageBanners(), ${e.toString()}');
    }
    return banners;
  }

  Future<List<Map<int, List<DiscountAdModel>>>> getDiscountAds() async {
    List<Map<int, List<DiscountAdModel>>> discountAds = [];
    try {
      QuerySnapshot<Map<String, dynamic>> discountAdsSnspshot =
          await firestore.collection('discount_ad').get();
      for (int i = 0; i < discountAdsSnspshot.docs.length; i++) {
        // discountAdsSnspshot.docs.length is for no of discounts available like 70% or 30%
        List productsList = discountAdsSnspshot.docs[i].data()['products'];
        Map<int, List<DiscountAdModel>> map = {};
        for (int j = 0; j < productsList.length; j++) {
          DiscountAdModel product = DiscountAdModel.fromMap(productsList[j]);
          int discountPercentage = product.percentage;
          if (map.containsKey(discountPercentage)) {
            map[discountPercentage]!.add(product);
          } else {
            map[discountPercentage] = [product];
          }
        }
        discountAds.add(map);
      }
    } catch (e) {
      log('Catch block in FirestoreController.getDiscountAds(), ${e.toString()}');
    }
    return discountAds;
  }

  // for test
  Future uploadByAdminRights(DiscountAdModel discountAdModel) async {
    try {
      var isDiscountAvailable = await firestore
          .collection('discount_ad')
          .doc(discountAdModel.percentage.toString())
          .get();
      if (isDiscountAvailable.data() == null) {
        //create that discount
        await firestore
            .collection('discount_ad')
            .doc(discountAdModel.percentage.toString())
            .set({
          'products': [discountAdModel.toJson()],
        });
        log('Creating a discount..');
      } else {
        // add this product to the discount list -->
        log('We have to add the product now!');
        await firestore
            .collection('discount_ad')
            .doc(discountAdModel.percentage.toString())
            .update({
          'products': FieldValue.arrayUnion([discountAdModel.toJson()]),
        });
      }
    } catch (e) {
      log(
        'Catch block in FirestoreController().adminRights(), ${e.toString()}',
      );
    }
  }
}
