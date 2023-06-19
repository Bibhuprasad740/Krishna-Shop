import 'package:flutter/material.dart';

import '../../../models/category_model.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/stock_colors.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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

    categories = await C.firestoreController.getCategories();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: C.kAppBarHeight + 10,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: SC.accent3,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 1,
            color: SC.accent1.withOpacity(0.2),
            offset: const Offset(2, 2),
          ),
        ],
      ),
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
