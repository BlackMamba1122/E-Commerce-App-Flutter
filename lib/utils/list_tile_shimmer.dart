import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/BShimmerEffect.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class BListTileShimmer extends StatelessWidget {
  const BListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column (
        children: [
          Row(
            children: [
              BShimmerEffect(width: 50, height: 50, radius: 50),
              SizedBox(width: BSizes.spaceBtwItems),
              Column(
                  children: [
                    BShimmerEffect(width: 100, height: 15),
                    SizedBox(height: BSizes.spaceBtwItems / 2),
                    BShimmerEffect(width: 80, height: 12),
                  ]
              ), // Column
            ],
          ),
        ] // ROW
    );
  }
}