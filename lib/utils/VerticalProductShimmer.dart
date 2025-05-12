import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

import 'BShimmerEffect.dart';

class BVerticalProductShimmer extends StatelessWidget {
  const BVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
    I
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BGridViewLayout(
        itemCount: itemCount,
        itemBuilder: (_,__) => SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BShimmerEffect(width: 180, height: 180),
              SizedBox(height: BSizes.spaceBtwItems,),
              BShimmerEffect(width: 160, height: 15),
              SizedBox(height: BSizes.spaceBtwItems/2,),
              BShimmerEffect(width: 110, height: 15),

            ],
          ),
        )
    );
  }
}