import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  const CustomDivider({
    Key? key,
    this.height = 1,
    this.color = SC.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        color: color,
      ),
    );
  }
}
