import 'package:flutter_application_1/features/authentication/controllers/onboarding_controllers.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingDots extends StatelessWidget {
  final int count;
  const OnBoardingDots({super.key,required this.count});
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardController.instance;
    final dark = BHelperFunctions.isDarkMode(context);
    return Positioned(
            bottom: BDeviceUtils.getBottomNavigationBarHeight()+25,
            left: BSizes.defaultSpace,
            child: SmoothPageIndicator(
              count: count,
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              effect: ExpandingDotsEffect(activeDotColor: BColors.primary, dotHeight: 6)
            ),
          );
  }
}