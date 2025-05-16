import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/appbar/cart_menu_icon.dart';
import 'package:flutter_application_1/features/personalization/controllers/UserController.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:get/get.dart';

import '../../../../../utils/BShimmerEffect.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Usercontroller());
    return BAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(BTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: BColors.grey)),
        Obx((){
          if(controller.profileLoading.value) {
            return const BShimmerEffect(width: 80,height: 15);
          } else {
            return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: BColors.white));
          }
        }),
      ],
    ),
    actions: const [
      CartCounterIcon(iconColor: BColors.white,counterBgColor: BColors.black,counterTextColor: BColors.white,)
    ],
    );
  }
}