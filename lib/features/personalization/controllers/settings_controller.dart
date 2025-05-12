import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  void logoutAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(BSizes.md),
      title: 'Logout Account',
      middleText:
      'Are you sure you want to logout your account ?',
      confirm: ElevatedButton(
        onPressed: () async => AuthenticationRepository.instance.logout(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: BColors.primary)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: BSizes.lg),
            child: Text('Logout')),
      ),
      // ElevatedButton
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ), // OutlinedButton
    );
  }
}