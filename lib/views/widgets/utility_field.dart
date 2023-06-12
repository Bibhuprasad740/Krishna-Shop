import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/constants.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';
import 'package:krishna_electronics/views/widgets/utility_item.dart';

class UtilityField extends StatelessWidget {
  const UtilityField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: SC.accent2,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: C.smallAds.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => UtilityItem(
          onTap: () {},
          imageUrl: C.smallAds[index],
          label: C.smallAdNames[index],
        ),
      ),
    );
  }
}
