import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controllers/firestore_controller.dart';
import '../../models/category_model.dart';
import '../../utilities/constants.dart';
import '../../utilities/stock_colors.dart';
import './category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final FirestoreController _firestoreController = FirestoreController();
  List<CategoryModel> categories = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    setState(() {
      isLoading = true;
    });

    // for (int i = 0; i < C.categoriesList.length; i++) {
    //   CategoryModel categoryModel = CategoryModel(
    //       categoryName: C.categoriesList[i], imageUrl: C.categoryLogos[i]);
    //   await _firestoreController.uploadByAdminRights(
    //     categoryModel: categoryModel,
    //   );
    // }

    List<QueryDocumentSnapshot<Map<String, dynamic>>> categorySnapshots =
        await _firestoreController.getCategories();
    for (int i = 0; i < categorySnapshots.length; i++) {
      CategoryModel categoryModel =
          CategoryModel.fromSnap(categorySnapshots[i]);
      categories.add(categoryModel);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: C.kAppBarHeight + 10,
      width: double.infinity,
      color: SC.accent2,
      child: isLoading
          ? const SizedBox()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  imageUrl: categories[index].imageUrl,
                  title: categories[index].categoryName,
                  onTap: () {},
                );
              },
              itemCount: categories.length,
            ),
    );
  }
}
