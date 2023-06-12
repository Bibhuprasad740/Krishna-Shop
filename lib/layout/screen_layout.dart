import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/constants.dart';
import '../utilities/stock_colors.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  ScreenLayoutState createState() => ScreenLayoutState();
}

class ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int pageIndex = 0;

  void updatePage(int page) {
    setState(() {
      pageIndex = page;
    });
  }

  void updateTab(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: updatePage,
        children: C.screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: SC.accent1,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.amber,
        inactiveColor: SC.accent2,
        backgroundColor: SC.accent1,
        onTap: updateTab,
        icons: const [
          Icons.home,
          Icons.person,
          FontAwesomeIcons.bagShopping,
          Icons.density_medium,
        ],
        activeIndex: pageIndex,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        gapLocation: GapLocation.center,
      ),
    );
  }
}
