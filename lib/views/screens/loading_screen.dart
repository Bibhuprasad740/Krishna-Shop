import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';
import 'package:krishna_electronics/views/widgets/custom_loading_spinner.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLoadingSpinner(
          color: SC.accent2,
        ),
      ),
    );
  }
}
