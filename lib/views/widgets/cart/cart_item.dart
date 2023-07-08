import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';
import './review_star.dart';
import './amount_buttons.dart';
import './cart_utility_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

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
                  'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1026&q=80',
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
                    child: const Text(
                      'The Bride made wood Decoration MacBook Air. Production Ready material and good Build quiality',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Text(
                    'Krishna Shop',
                    style: TextStyle(
                      color: SC.facebook,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Rating widget
                  const ReviewStar(),
                  // Price
                  Row(
                    children: [
                      Text(
                        '₹ 1299',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: SC.accent1.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '₹ 999',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: SC.accent1,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Quantity button
                      const AmountButton(amount: 1),
                    ],
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 50),
          // bottom 3 buttons
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CartUtilityButton(
                label: 'Remove',
                icon: Icons.delete,
                opacity: 0.7,
              ),
              CartUtilityButton(
                label: 'Save',
                icon: Icons.favorite,
                opacity: 0.7,
              ),
              CartUtilityButton(
                label: 'Buy Now',
                icon: Icons.shopping_bag,
                opacity: 0.7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
