import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/repositories/authentication.dart';
import '../../../utils/constants/imge_string.dart';
import '../../../utils/network.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class loginController extends GetxController {
  // static loginController get instance => Get.find();
  final hidepass=true.obs;
  final rememberme=false.obs;
  final localStorage=GetStorage();
  final email=TextEditingController();
  final pass=TextEditingController();
  GlobalKey<FormState>LoginFormkey=GlobalKey<FormState>();

  @override
  void onInit() {
    email.text=localStorage.read('Remember_me_Email') ?? '';
    pass.text=localStorage.read('Remember_me_Password')?? '';
    super.onInit();
  }

  Future<void> SignIn() async {
    try {
      BFullScreenLoader.openLoadingDialog(
          'We are processing your information', BImages.docker);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!LoginFormkey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (rememberme.value) {
        localStorage.write('Remember_me_Email', email.text.trim());
        localStorage.write('Remember_me_Password', pass.text.trim());
      }
      final user = await AuthenticationRepository.instance
          .login(email.text.trim(), pass.text.trim());
      BFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirects();
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}