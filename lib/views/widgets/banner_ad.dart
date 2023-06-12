import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';
import 'package:krishna_electronics/utilities/utility_functions.dart';

import '../../models/front_page_banner_model.dart';
import '../../utilities/constants.dart';

class FrontPageBanner extends StatefulWidget {
  const FrontPageBanner({Key? key}) : super(key: key);

  @override
  FrontPageBannerState createState() => FrontPageBannerState();
}

class FrontPageBannerState extends State<FrontPageBanner> {
  bool isLoading = false;
  List<FrontPageBannerModel> banners = [];
  int currentBanner = 0;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    setState(() {
      isLoading = true;
    });
    banners = await C.firestoreController.getFrontPageBanners();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return isLoading
        ? const SizedBox()
        : GestureDetector(
            onHorizontalDragEnd: (_) {
              currentBanner = (currentBanner + 1) % banners.length;
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Image.network(
                    banners[currentBanner].imageUrl,
                    width: double.infinity,
                    height: size.height * 0.6,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          SC.accent1.withOpacity(0.3),
                          Colors.transparent,
                          Colors.transparent,
                          SC.accent1.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: SC.accent1.withOpacity(0.3),
                            child: IconButton(
                              onPressed: () {
                                currentBanner =
                                    (currentBanner - 1) % banners.length;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 18,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: SC.accent1.withOpacity(0.3),
                            child: IconButton(
                              onPressed: () {
                                currentBanner =
                                    (currentBanner + 1) % banners.length;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
