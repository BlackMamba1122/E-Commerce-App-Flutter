import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/forget_password_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(forgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(BTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: BSizes.spaceBtwItems),
            Text(BTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: BSizes.spaceBtwSections*2),
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator:(value)=> BValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: BTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)
                ),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child:  ElevatedButton(onPressed: ()=>controller.sendEmail() , child: const Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}