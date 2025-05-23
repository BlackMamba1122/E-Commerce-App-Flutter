import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.image, required this.title, required this.subTitle});

  final String image,title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(BSizes.defaultSpace),
              child:Column(
                children: [
                  Image(
                    width: BHelperFunctions.screenWidth() * 0.8,
                    height: BHelperFunctions.screenHeight() * 0.6,
                    image: AssetImage(image),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
  }
}