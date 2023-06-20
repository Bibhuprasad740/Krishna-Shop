import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';

class SimpleButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const SimpleButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: SC.accent2,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: SC.accent3,
              child: Icon(
                icon,
                color: SC.accent1,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: SC.accent1,
                letterSpacing: 1,
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: SC.accent3,
            ),
          ],
        ),
      ),
    );
  }
}
