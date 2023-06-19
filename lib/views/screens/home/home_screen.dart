import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/constants.dart';
import 'package:krishna_electronics/views/widgets/ads/discount_ad.dart';
import 'package:krishna_electronics/views/widgets/ads/product_ad.dart';

import '../../../models/discount_ad_model.dart';
import '../../widgets/ads/front_page_banner_ad.dart';
import '../../widgets/category/categories_list.dart';
import '../../widgets/utillity_widgets/utility_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<int, List<DiscountAdModel>>> discountAds = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getDiscountAds();
  }

  Future getDiscountAds() async {
    setState(() {
      isLoading = true;
    });
    discountAds = await C.firestoreController.getDiscountAds();
    // print(discountAds[0][discountAds[0].keys.first]![0]);
    discountAds = discountAds.reversed.toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CategoriesList(),
              const FrontPageBanner(),
              const UtilityField(),
              ...discountAds.map((adItem) {
                return isLoading
                    ? const SizedBox(
                        height: 500,
                      )
                    : DiscountAd(
                        title: adItem.keys.first.toString(),
                        children: [
                          ...adItem[adItem.keys.first]!.map((discountAdModel) {
                            return ProductAd(
                              discountAdModel: discountAdModel,
                              onTap: () {},
                            );
                          }).toList(),
                        ],
                      );
              }).toList(),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
