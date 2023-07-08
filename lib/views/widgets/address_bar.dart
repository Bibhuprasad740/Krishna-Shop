import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';
import '../../utilities/utility_functions.dart';

class AddressBar extends StatelessWidget {
  final double offset;
  const AddressBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: SC.gradientLight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(width: 10),
          SizedBox(
            width: size.width * 0.5,
            child: const Text(
              'Deliver to Bibhu Prasad Sahoo, At - Tangi, Post - Kotasahi, PIN - 754022',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: SC.accent1),
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SC.accent1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}
