import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/BShimmerEffect.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: BSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_,__)=>const SizedBox(width: BSizes.spaceBtwItems),
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,__)=>Row(
            mainAxisSize: MainAxisSize.min,
            children:[
              BShimmerEffect(width: 120, height: 120),
              SizedBox(width: BSizes.spaceBtwItems,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: BSizes.spaceBtwItems/2,),
                  BShimmerEffect(width: 160, height: 15),
                  SizedBox(height: BSizes.spaceBtwItems/2,),
                  BShimmerEffect(width: 110, height: 15),
                  SizedBox(height: BSizes.spaceBtwItems/2,),
                  BShimmerEffect(width: 80, height: 15),
                  Spacer(),
                  ]
              )
            ]
          ),
      ),
    );
  }
}
