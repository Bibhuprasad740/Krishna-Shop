import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class CartUtilityButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final double opacity;
  final Color color;
  const CartUtilityButton(
      {Key? key,
      required this.label,
      this.icon,
      this.opacity = 1,
      this.color = SC.accent1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.01),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: SC.accent1.withOpacity(opacity),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: color.withOpacity(opacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
