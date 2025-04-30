import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import '../../controllers/UpdateNameController.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: BAppBar(
        showArrow: true,
        title: Text('Change Name', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
      ), // TAppBar
      body: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,
            ), // Text
            const SizedBox (height: BSizes.spaceBtwSections),
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          BValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration (
                          labelText: BTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ), // TextFormField
                    const SizedBox (height: BSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          BValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration (
                          labelText: BTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ), // TextFormField
                  ],
                )), // Column, Form
            const SizedBox(height: BSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUsername(),
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}// Sized Box