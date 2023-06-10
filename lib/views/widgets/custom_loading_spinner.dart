import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utilities/stock_colors.dart';

class CustomLoadingSpinner extends StatelessWidget {
  final Color color;
  const CustomLoadingSpinner({
    Key? key,
    this.color = SC.accent2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotate,
        colors: [color, SC.error],
      ),
    );
  }
}
