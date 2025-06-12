import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/store/b_brand_cart.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/brand_product.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../../utils/BShimmerEffect.dart';

class BBrandShowCase extends StatelessWidget {
  const BBrandShowCase({
    super.key, required this.images, required this.brand,
  });
  final List<String> images;
  final  BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>BrandProduct(brand: brand)),
      child: CircleConatiner(
        showBorder: true,
        borderColor: BColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(BSizes.md),
        margin: const EdgeInsets.only(bottom: BSizes.spaceBtwItems),
        child: Column(
          children: [
            BBrandCart(showBorder: false,onTap: (){}, brand: brand,),
            const SizedBox(height: BSizes.spaceBtwItems),
            Row( children: images.map((image)=> brandTopProductImageWidget(image, context,true)).toList())
          ],
        ),
      ),
    );
  }
}


Widget brandTopProductImageWidget(String image,context,bool isNetworkImage)
{
  return Expanded(
                child: CircleConatiner(
                  height: 100,
                  backgroundColor: BHelperFunctions.isDarkMode(context) ? BColors.darkerGrey : BColors.light,
                  margin: const EdgeInsets.only(right: BSizes.sm),
                  padding: const EdgeInsets.all(BSizes.md),
                  child:  isNetworkImage
                      ? CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const BShimmerEffect(
                      width: 100,
                      height: 100,
                      radius: 100,
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image, size: 40),
                  )
                      : Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),

                ),
              );
}