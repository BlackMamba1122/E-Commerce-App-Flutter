import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';


class BSearchBar extends StatelessWidget {
  const BSearchBar({
    super.key, this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace),
        child: Container(
          width: BDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(BSizes.md),
          decoration: BoxDecoration(
            color: dark ? BColors.dark : BColors.light,
            borderRadius: BorderRadius.circular(BSizes.cardRadiusLg),
            border: Border.all(color: BColors.grey)
          ),
          child: Row(
            children: [
              const Icon(Iconsax.search_normal, color: BColors.darkGrey),
              const SizedBox(width: BSizes.spaceBtwItems),
              Text('Search in Store', style: Theme.of(context).textTheme.bodySmall),
      
            ],
          ),
          
        ),
      ),
    );
  }
}
