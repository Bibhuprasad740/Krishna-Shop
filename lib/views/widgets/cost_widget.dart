import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';

class CostWidget extends StatelessWidget {
  final double originalCost, discountedCost;
  const CostWidget({
    Key? key,
    required this.originalCost,
    required this.discountedCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '₹ $originalCost',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            decoration: TextDecoration.lineThrough,
            color: SC.accent1.withOpacity(0.4),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '₹ $discountedCost',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: SC.accent1,
          ),
        ),
      ],
    );
  }
}
