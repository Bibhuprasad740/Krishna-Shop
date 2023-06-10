import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: SC.accent1,
      minHeight: 3,
      backgroundColor: SC.error,
    );
  }
}
