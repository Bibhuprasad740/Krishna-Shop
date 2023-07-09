import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';
import '../cart/review_star.dart';
import '../cost_widget.dart';

class SearchResultWidget extends StatelessWidget {
  final ProductModel product;
  const SearchResultWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return Container(
      // color: Colors.pink,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      color: SC.accent2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.fill,
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                ),
              ),
              const SizedBox(width: 20),
              // The right side title column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    product.sellerName,
                    style: const TextStyle(
                      color: SC.facebook,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Rating widget
                  ReviewStar(
                    rating: product.rating,
                    noOfRating: product.noOfRating,
                  ),
                  // Price
                  Row(
                    children: [
                      CostWidget(
                        originalCost: product.cost,
                        discountedCost: (product.cost) -
                            (product.cost * product.discount / 100),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              )
            ],
          ),
          // const SizedBox(height: 50),
        ],
      ),
    );
  }
}
