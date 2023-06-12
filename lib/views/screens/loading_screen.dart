import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';
import '../widgets/custom_loading_spinner.dart';

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
