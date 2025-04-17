import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login/form_devider.dart';
import 'package:flutter_application_1/common/widgets/login/social_media_buttons.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/signup_form.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              Text(BTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              const SignupForm(),
              const SizedBox(height: BSizes.spaceBtwSections,),
              FormDivider(dividertext: BTexts.orSignUpWith.capitalize!),
              const SizedBox(height: BSizes.spaceBtwSections,),
              const SocialMediaButtons(),
            ]
          ),
          ), 
      ),
    );
  }
}