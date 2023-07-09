import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../widgets/address_bar.dart';
import '../../widgets/cart/cart_item.dart';
import '../../widgets/cart/proceed_in_cart_button.dart';
import '../../widgets/cart/cart_utility_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const AddressBar(offset: 0),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => CartItem(product: C.demoProduct),
            ),
          ),
          const Row(
            children: [
              CartUtilityButton(
                label: 'Total ₹4995',
              ),
              ProceedInCartButton(),
            ],
          ),
          // const SizedBox(height: 10)
        ],
      ),
    );
  }
}
