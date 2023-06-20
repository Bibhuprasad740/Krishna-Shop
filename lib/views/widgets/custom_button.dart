import 'package:flutter/material.dart';

import '../../utilities/utility_functions.dart';
import './custom_loading_spinner.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool isLoading;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(
          size.width,
          40,
        ),
      ),
      child: isLoading ? const CustomLoadingSpinner() : Text(title),
    );
  }
}
