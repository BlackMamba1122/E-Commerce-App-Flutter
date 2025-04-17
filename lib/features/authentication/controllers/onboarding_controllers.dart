import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardController extends GetxController {
  static OnBoardController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
          pageController.animateToPage(
        index,
        duration:
            const Duration(milliseconds: 300), // Adjust the duration as needed
        curve: Curves.easeInOut, // Adjust the animation curve if desired
      );

  }

void nextPage() {
    if (currentPageIndex.value == 3) {
      final storage =GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      //currentPageIndex.value = page;
      pageController.animateToPage(
        page,
        duration:
            const Duration(milliseconds: 300), // Adjust the duration as needed
        curve: Curves.easeInOut, // Adjust the animation curve if desired
      );
    }
  }

  void skipPage() {
          final storage =GetStorage();
      storage.write('IsFirstTime', false);
    Get.offAll(const LoginScreen());
  }
}