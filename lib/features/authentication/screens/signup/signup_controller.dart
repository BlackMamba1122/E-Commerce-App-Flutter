import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/fulScreenLoader.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:get/get.dart';

class SignupController extends GetxController { 
    static SignupController get instance => Get.find();

    final email= TextEditingController();
    final password= TextEditingController();
    final lastname= TextEditingController();
    final username= TextEditingController();
    final firstname= TextEditingController();
    final phoneNumber= TextEditingController();
    GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  Future<void> signup() async {
    try {
      BFullScreenLoader.openLoadingDialog('We are processing your information', BImages.darkAppLogo);
      
      // final isConnected = await Networkmanager.instance.isConnected();

      if(signupFormKey.currentState!.validate()) {
        BFullScreenLoader.stoploading();
        return;
      }
      
    } finally {
        BFullScreenLoader.stoploading();
    }
  }
}