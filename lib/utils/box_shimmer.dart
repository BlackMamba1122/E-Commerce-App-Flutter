import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/BShimmerEffect.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class BBoxesShimmer extends StatelessWidget {
  const BBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column (
        children: [
          Row(
              children: [
                Expanded(child: BShimmerEffect(width: 150, height: 110)),
                SizedBox(width: BSizes.spaceBtwItems),
                Expanded(child: BShimmerEffect(width: 150, height: 110)),
                SizedBox(width: BSizes.spaceBtwItems),
                Expanded(child: BShimmerEffect(width: 150, height: 110)),
              ]
          ), // ROW
        ]
    );
  }
}// Column