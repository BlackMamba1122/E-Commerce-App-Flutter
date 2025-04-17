import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_style.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});
  final String image,title,subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BspacingStyle.paddingwithAppBarHeight * 2,
          child: Column(
            children: [
              Image(image: AssetImage(image),width: BHelperFunctions.screenWidth()*0.6,),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed, child: const Text(BTexts.continu))),

            ],
          ),
        ),
      ),
    );
  }
}