import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/personalization/controllers/UserController.dart';
import 'package:get/get.dart';
import '../../../data/repositories/user_repo.dart';
import '../../../utils/constants/imge_string.dart';
import '../../../utils/network.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = Usercontroller.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUsername() async {
    try {
// Start Loading
      BFullScreenLoader.openLoadingDialog(
          'We are updating your information...', BImages.docker);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateUserSingleRecord(name);
// Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.refresh();
// Remove Loader
      BFullScreenLoader.stopLoading();
// Show Success Message
      BLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');
// Move to previous screen.

    Get.close(1);
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
