import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/features/personalization/controllers/UserController.dart';
import 'package:flutter_application_1/utils/network.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_application_1/features/personalization/models/UserModel.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final userController=Get.put(Usercontroller());
  final hidePass = true.obs;
  final Privacy = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          'We are processing your information', BImages.docker);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;
      if (!signupFormKey.currentState!.validate()) return;
      if (!Privacy.value) {
        BLoaders.warningSnackBar(
            title: 'Accept Privacy Policy', message: 'Accept Privacy Policy');
        return;
      }
      final user = await AuthenticationRepository.instance
          .register(email.text.trim(), password.text.trim());
      final newUser = UserModel(
          id: user.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      await userController.saveUserRecord(newUser);
      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(
          title: 'Congratulation', message: 'Account Created');
      Get.to(() => VerifyEmail(email: email.text.trim(),));
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
