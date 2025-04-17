import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/store/b_brand_cart.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class BBrandShowCase extends StatelessWidget {
  const BBrandShowCase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CircleConatiner(
      showBorder: true,
      borderColor: BColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(BSizes.md),
      margin: const EdgeInsets.only(bottom: BSizes.spaceBtwItems),
      child: Column(
        children: [
          BBrandCart(showBorder: false,onTap: (){}),
          const SizedBox(height: BSizes.spaceBtwItems),
          Row( children: images.map((image)=> brandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }
}


Widget brandTopProductImageWidget(String image,context)
{
  return Expanded(
                child: CircleConatiner(
                  height: 100,
                  backgroundColor: BHelperFunctions.isDarkMode(context) ? BColors.darkerGrey : BColors.light,
                  margin: const EdgeInsets.only(right: BSizes.sm),
                  padding: const EdgeInsets.all(BSizes.md),
                  child:  Image(fit: BoxFit.contain,image: AssetImage(image)),
                ),
              );
}