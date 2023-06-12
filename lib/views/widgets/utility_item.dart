import 'package:flutter/material.dart';

class UtilityItem extends StatelessWidget {
  final String imageUrl, label;
  final VoidCallback onTap;
  const UtilityItem({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
