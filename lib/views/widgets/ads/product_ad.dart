import 'package:flutter/material.dart';

import '../../../models/discount_ad_model.dart';
import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';

class ProductAd extends StatelessWidget {
  final DiscountAdModel discountAdModel;
  final VoidCallback onTap;
  const ProductAd({
    Key? key,
    required this.discountAdModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.7,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                discountAdModel.bannerUrl,
                fit: BoxFit.fill,
                height: size.height * 0.3,
                width: size.width * 0.7,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                alignment: Alignment.bottomRight,
                height: 100,
                width: size.width * 0.7,
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      SC.accent1.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Text(
                  discountAdModel.productName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: SC.accent2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
