import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/stock_colors.dart';
import '../../utilities/utility_functions.dart';
import '../screens/home/search_screen.dart';

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
          builder: (_) => const SearchScreen(),
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
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: SC.accent1.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(2, 2),
                ),
              ]),
              child: TextField(
                onTap: () => navigateToSearchScreen(context),
                readOnly: isReadOnly,
                decoration: InputDecoration(
                  fillColor: SC.accent2,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: SC.border,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: SC.border,
                      width: 1,
                    ),
                  ),
                  hintText: 'Search on Krishna shop',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: SC.border,
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
