import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class ReviewStar extends StatelessWidget {
  final int rating, noOfRating;
  const ReviewStar({
    Key? key,
    required this.rating,
    required this.noOfRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        i < rating
            ? const Icon(
                Icons.star,
                color: SC.accent3,
                size: 15,
              )
            : const Icon(
                Icons.star_border,
                color: SC.accent3,
                size: 15,
              ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        const SizedBox(width: 10),
        Text('($noOfRating)'),
      ],
    );
  }
}
