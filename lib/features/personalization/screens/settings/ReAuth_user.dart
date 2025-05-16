import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/personalization/controllers/UserController.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/validators/validator.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Usercontroller.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: BValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: BTexts.email),
                ), // TextFormField
                const SizedBox(height: BSizes.spaceBtwInputFields),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifypassword,
                    validator: (value) =>
                        BValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: BTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: const Icon(Iconsax.eye_slash),
                      ), // IconButton
                    ), // InputDecoration
                  ), // TextFormField
                ), // Obx
                const SizedBox(height: BSizes.spaceBtwSections),

                /// LOGIN Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Verify')),
                ), // SizedBox
              ],
            ), // Column
          ), // Form
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
