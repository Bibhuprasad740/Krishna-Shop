import 'package:flutter/material.dart';

import '../../../utilities/stock_colors.dart';

class ReviewStar extends StatelessWidget {
  const ReviewStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: SC.accent3,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: SC.accent3,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: SC.accent3,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: SC.accent3,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: SC.accent3,
          size: 15,
        ),
        SizedBox(width: 10),
        Text('(125)')
      ],
    );
  }
}
