import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login/success_screen.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../controllers/verify_email_controller.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(BImages.verifyEmail), width: BHelperFunctions.screenWidth()*0.6),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(BTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              Text(BTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>controller.checkEmailVerifyStatus(),
                  child: const Text(BTexts.continu))),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=>controller.SendEmailVerify(), child: const Text(BTexts.resendEmail,style: TextStyle(color: BColors.primary),))),
              const SizedBox(height: BSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
