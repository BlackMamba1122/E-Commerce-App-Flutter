import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BAppBar({super.key, this.title, this.showArrow=false, this.leadingicon, this.actions, this.leadingonPressed});
  final Widget? title;
  final bool showArrow;
  final IconData? leadingicon;
  final List<Widget>? actions;
  final VoidCallback? leadingonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showArrow
          ? IconButton(onPressed: ()=> Get.back(), icon: const Icon(Iconsax.arrow_left))
          : leadingicon !=null ? IconButton(onPressed: ()=> leadingonPressed, icon: Icon(leadingicon)):null,
          title: title,
          actions: actions,
        ),
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(BDeviceUtils.getAppBarHeight());
}