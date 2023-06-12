import 'package:flutter/material.dart';
import 'package:krishna_electronics/views/widgets/banner_ad.dart';
import 'package:krishna_electronics/views/widgets/utility_field.dart';

import '../../widgets/categories_list.dart';
import '../../widgets/custom_search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomSearchBar(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FrontPageBanner(),
              CategoriesList(),
              UtilityField(),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
