import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:flutter_application_1/features/authentication/screens/onboard/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController { 
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirects();
}

screenRedirects() async {
  deviceStorage.writeIfNull('IsFirstTime', true);
  deviceStorage.read('IsFirstTime') != true ? Get.offAll(()=> const LoginScreen()) : Get.offAll(()=> const OnboardScreen());
}
}