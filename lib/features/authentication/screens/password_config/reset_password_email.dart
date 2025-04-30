import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../controllers/forget_password_controller.dart';

class ResetPasswordEmail extends StatelessWidget {
  const ResetPasswordEmail({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.offAll(()=>const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(BImages.verifyEmail), width: BHelperFunctions.screenWidth()*0.6),
              const SizedBox(height: BSizes.spaceBtwSections),
              Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(BTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(BTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>Get.offAll(()=>const LoginScreen()),
                  child: const Text('Done'))),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=>forgetPasswordController.instance.resendEmail(email), child: const Text(BTexts.resendEmail))),
              const SizedBox(height: BSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
