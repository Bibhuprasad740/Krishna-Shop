import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/stock_colors.dart';
import '../../widgets/search/custom_search_bar_widget.dart';
import '../../widgets/search/search_result_widget.dart';

class SearchScreen extends StatelessWidget {
  final String query;
  const SearchScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomSearchBar(
          hasBackButton: true,
          isReadOnly: false,
        ),
        body: query == ''
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Showing results for ',
                            style: TextStyle(color: SC.accent1),
                          ),
                          TextSpan(
                            text: '"$query"',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: SC.accent1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => SearchResultWidget(
                          product: C.demoProduct,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
