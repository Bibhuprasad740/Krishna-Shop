import 'package:flutter/material.dart';

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
      ),
    );
  }
}
