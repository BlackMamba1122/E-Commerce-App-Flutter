import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding_controllers.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';
 

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Positioned(
            right: BSizes.defaultSpace,
            bottom: BDeviceUtils.getBottomNavigationBarHeight(),
            child: ElevatedButton(
              onPressed: () => OnBoardController.instance.nextPage(),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: const Icon(Iconsax.arrow_right_3),
            ),
          );
  }
}