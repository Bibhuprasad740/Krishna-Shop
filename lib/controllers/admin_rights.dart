/* 

  | Upload Categories |
  
    // Firebase Method -->
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

    // Function Call in initState(){} of CategoriesList() -->
      for (int i = 0; i < C.categoriesList.length; i++) {
        CategoryModel categoryModel = CategoryModel(
            categoryName: C.categoriesList[i], imageUrl: C.categoryLogos[i]);
        await _firestoreController.uploadByAdminRights(
          categoryModel: categoryModel,
        );
      }

    | UPLOAD FRONTPAGE BANNER |

    // Firestore method --> 
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


    // Function call in initState(){} of CategoriesList() -->
      for (int i = 0; i < C.frontPageBanner.length; i++) {
        FrontPageBannerModel frontPageBannerModel = FrontPageBannerModel(
          imageUrl: C.frontPageBanner[i],
          productId: i.toString(),
        );
        await _firestoreController.uploadByAdminRights(
          frontPageBannerModel: frontPageBannerModel,
          adType: 'frontPageBanner',
        );
      }
  */