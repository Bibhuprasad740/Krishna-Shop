import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class ProceedInCartButton extends StatelessWidget {
  const ProceedInCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: SC.accent3,
        margin: const EdgeInsets.only(right: 2),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: const Text(
          'Place Order',
          style: TextStyle(
            fontSize: 16,
            color: SC.accent1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
