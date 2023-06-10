import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/utility_functions.dart';
import 'package:krishna_electronics/views/widgets/custom_loading_spinner.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.child,
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
      child: isLoading ? const CustomLoadingSpinner() : child,
    );
  }
}
