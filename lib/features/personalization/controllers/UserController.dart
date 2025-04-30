import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/user_repo.dart';
import 'package:flutter_application_1/features/personalization/models/UserModel.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/authentication.dart';
import '../../../utils/constants/imge_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/network.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/settings/ReAuth_user.dart';

class Usercontroller extends GetxController {
  static Usercontroller get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel
      .empty()
      .obs;
  final profileLoading = false.obs;

  final verifyEmail = TextEditingController();
  final verifypassword = TextEditingController();
  final hidePassword = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final imageUploading=false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserModel? usercredentails) async {
    try {
      await fetchUserRecord();
      if(user.value.id.isEmpty) {
        if (usercredentails != null) {
          await userRepository.saveUserRecord(usercredentails);
        }
      }
    } catch (e) {
      BLoaders.warningSnackBar(
          title: 'Data Not Saved', message: 'Something went wrong. Try again');
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(BSizes.md),
      title: 'Delete Account',
      middleText:
      'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: BSizes.lg),
            child: Text('Delete')),
      ),
      // ElevatedButton
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ), // OutlinedButton
    );
  }

  void deleteUserAccount() async {
    try {
      BFullScreenLoader.openLoadingDialog('Processing', BImages.docker);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!
              .providerData
              .map((e) => e.providerId)
              .first;
      if (provider.isNotEmpty) {
// Re Verify Auth Email
//         if (provider == 'google.com') {
//           await auth.signInWithGoogle();
//           await auth.deleteAccount();
//           TFullScreenLoader.stop Loading();
//           Get.offAll(() => const LoginScreen());
//         } else if (provider == 'password') {
        BFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
        //}
      }
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      BFullScreenLoader.openLoadingDialog('Processing', BImages.docker);
//Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifypassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      BFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  uploadProfilePicture() async{
    try{

    final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
    if(image !=null) {
      imageUploading.value = true;
      final imageurl = await userRepository.uploadImage(
          'Users/Images/Profile/', image);
      Map<String, dynamic> json = {'ProfilePicture': imageurl};
      await userRepository.updateUserSingleRecord(json);
      user.value.profilePicture = imageurl;
      user.refresh();
      BLoaders.successSnackBar(title: 'Congratulations',message: 'Profile Picture Uploaded');
    }
    } catch(e){
     BLoaders.errorSnackBar(title: 'Oh Snap',message: 'Something went wrong');
    }finally{
      imageUploading.value=false;
    }
  }
}