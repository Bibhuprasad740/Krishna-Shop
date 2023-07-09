import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';
import '../../screens/home/search_screen.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadOnly, hasBackButton;
  const CustomSearchBar({
    Key? key,
    this.isReadOnly = true,
    this.hasBackButton = false,
  })  : preferredSize = const Size.fromHeight(C.kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  void navigateToSearchScreen(BuildContext context) {
    if (isReadOnly) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const SearchScreen(query: ''),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return Container(
      height: C.kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: SC.gradientLight),
      ),
      child: Row(
        mainAxisAlignment: hasBackButton
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: size.width * 0.75,
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(30),
              //   boxShadow: [
              //     BoxShadow(
              //       color: SC.accent1.withOpacity(0.2),
              //       blurRadius: 8,
              //       spreadRadius: 1,
              //       offset: const Offset(2, 2),
              //     ),
              //   ],
              // ),
              child: TextField(
                onSubmitted: (String query) {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (_) => SearchScreen(query: query),
                    ),
                  );
                },
                onTap: () => navigateToSearchScreen(context),
                readOnly: isReadOnly,
                autofocus: !isReadOnly,
                decoration: InputDecoration(
                  fillColor: SC.accent2,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      // color: SC.accent3,
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  hintText: 'Search on Krishna shop',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: SC.border,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic_none_outlined,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
