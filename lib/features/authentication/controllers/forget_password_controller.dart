import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/features/authentication/screens/password_config/reset_password_email.dart';
import 'package:get/get.dart';

import '../../../utils/constants/imge_string.dart';
import '../../../utils/network.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class forgetPasswordController extends GetxController {
  static forgetPasswordController get instance => Get.find();

  final email=TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendEmail() async
  {
    try{
      BFullScreenLoader.openLoadingDialog(
          'We are processing your information', BImages.docker);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.resetPassword(email.text.trim());
        BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(title: 'Sent',message: 'Email Sent');
      Get.to(()=> ResetPasswordEmail(email: email.text.trim(),));
    }catch (e){
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendEmail(String email) async {
    try {
      BFullScreenLoader.openLoadingDialog(
          'We are processing your information', BImages.docker);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.resetPassword(email);
      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(title: 'Sent', message: 'Email RE-Sent');
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}