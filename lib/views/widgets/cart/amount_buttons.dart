import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class AmountButton extends StatelessWidget {
  final int amount;
  const AmountButton({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: SC.border,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.remove,
            size: 25,
            color: SC.border,
          ),
          const SizedBox(width: 5),
          Text(
            amount.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.add,
            size: 25,
            color: SC.border,
          )
        ],
      ),
    );
  }
}
