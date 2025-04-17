import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/onboard/widgets/on_boarding_next_button.dart';
import 'package:flutter_application_1/features/authentication/screens/onboard/widgets/onboarding_dots.dart';
import 'package:flutter_application_1/features/authentication/screens/onboard/widgets/onboarding_skip.dart';
import 'package:flutter_application_1/features/authentication/screens/onboard/widgets/onboarding_page.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding_controllers.dart';
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const[
              OnboardingPage(image: BImages.onBoardImage1, title: BTexts.onBoardingTitle1, subTitle: BTexts.onBoardingSubTitle1,),
              OnboardingPage(image: BImages.onBoardImage2, title: BTexts.onBoardingTitle2, subTitle: BTexts.onBoardingSubTitle2,),
              OnboardingPage(image: BImages.onBoardImage3, title: BTexts.onBoardingTitle3, subTitle: BTexts.onBoardingSubTitle3,),
              OnboardingPage(image: BImages.onBoardImage4, title: BTexts.onBoardingTitle4, subTitle: BTexts.onBoardingSubTitle4,),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDots(count:4),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
  
}


