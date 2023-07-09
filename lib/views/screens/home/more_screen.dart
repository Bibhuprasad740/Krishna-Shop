import 'package:flutter/material.dart';

import '../../../models/category_model.dart';
import '../../../utilities/constants.dart';
import '../../widgets/category/category_item.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
    return Scaffold(
      body: Center(
        child: isLoading
            ? const SizedBox()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  imageUrl: categories[index].imageUrl,
                  title: categories[index].categoryName,
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
