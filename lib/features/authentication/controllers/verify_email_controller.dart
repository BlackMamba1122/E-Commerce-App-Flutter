import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../common/widgets/login/success_screen.dart';
import '../../../utils/constants/imge_string.dart';
import '../../../utils/constants/text_string.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance=>Get.find();
  @override
  void onInit() {
    SendEmailVerify();
    SetTimer();
    super.onInit();
  }
  SendEmailVerify() async{
    try {
      await AuthenticationRepository.instance.sendEmailVerify();
      BLoaders.successSnackBar(title: 'Sent',message: 'Email Sent');
    }catch(e) {
      BLoaders.errorSnackBar(title: 'Error',message: e.toString());
    }
  }
  SetTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ??  false){
        timer.cancel();
        Get.off(()=>SuccessScreen(
            image: BImages.complete,
            title: BTexts.yourAccountCreatedTitle,
            subtitle: BTexts.yourAccountCreatedSubTitle,
            onPressed: ()=>AuthenticationRepository.instance.screenRedirects()
        ),);
      }

    });
  }
  checkEmailVerifyStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!= null && currentUser.emailVerified)
      {
        Get.off(()=>SuccessScreen(
            image: BImages.complete,
            title: BTexts.yourAccountCreatedTitle,
            subtitle: BTexts.yourAccountCreatedSubTitle,
            onPressed: ()=>AuthenticationRepository.instance.screenRedirects()
        ),);
      }
  }
}