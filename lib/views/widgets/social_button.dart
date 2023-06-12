import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String name;
  final bool isLoading;
  final Color color;
  const SocialButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.name,
    this.isLoading = false,
    this.color = SC.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading
            ? const SizedBox()
            : Icon(
                icon,
                size: 25,
                color: color,
              ),
      ),
    );
  }
}
