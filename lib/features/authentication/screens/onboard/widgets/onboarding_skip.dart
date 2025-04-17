import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding_controllers.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(top: BDeviceUtils.getAppBarHeight(),right: BSizes.defaultSpace ,child: TextButton(onPressed:()=>OnBoardController.instance.skipPage(), child: const Text('Skip',style:TextStyle(color: BColors.primary))));
  }
}