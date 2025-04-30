import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/personalization/controllers/UserController.dart';
import 'package:flutter_application_1/features/personalization/screens/profile/Profile.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/imge_string.dart';
import '../store/b_circular_image.dart';

class BUserProfile extends StatelessWidget {
  const BUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Usercontroller.instance;
    return Obx(() {
      final networkImage = controller.user.value.profilePicture;
      final image = networkImage.isNotEmpty ? networkImage : BImages.user;
      return ListTile(
        leading: BCircularImage(
                image: image,
                width: 80,
                height: 80,
                isNetworkImage: networkImage.isNotEmpty,
              ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: BColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: BColors.white),
        ),
        trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: BColors.white,
          ),
        ),
      );
    });
  }
}
