import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/store/b_circular_image.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class BBrandCart extends StatelessWidget {
  const BBrandCart({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });
  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: CircleConatiner(
      padding: const EdgeInsets.all(BSizes.sm),
      showBorder: showBorder,
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
           Flexible(
            child: BCircularImage(
              isNetworkImage: true,
              image: brand.image,
             overlayColor: BHelperFunctions.isDarkMode(context) ? BColors.white : BColors.dark,
            ),
          ),
          const SizedBox(width: BSizes.spaceBtwItems/2),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BBrandTitle(title: brand.name, brandTextSize: TextSizes.large),
                Text(
                  '${brand.productsCount ?? 0} Products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          
        ],
        ),
    ),
                        );
  }
}
