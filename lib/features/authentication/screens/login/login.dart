import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_style.dart';
import 'package:flutter_application_1/common/widgets/login/form_devider.dart';
import 'package:flutter_application_1/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_application_1/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_application_1/common/widgets/login/social_media_buttons.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BspacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),

              FormDivider(dividertext: BTexts.orSignInWith.capitalize!),

              const SizedBox(height: BSizes.spaceBtwSections),
              
              const SocialMediaButtons(),
            ],
          ),
        ),
      ),
    );
  }
}