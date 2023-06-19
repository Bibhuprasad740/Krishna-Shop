import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl, title;
  final VoidCallback onTap;
  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: SC.accent1.withOpacity(0.0),
          padding: const EdgeInsets.all(0),
          elevation: 0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: SC.background,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  color: SC.accent1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
