import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class BTabBar extends StatelessWidget implements PreferredSizeWidget {
  const BTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? BColors.black : BColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: BColors.primary,
        labelColor: dark ? BColors.white : BColors.primary,
        unselectedLabelColor: BColors.darkGrey,
      ), // TabBar
    ); // Material
  }

  @override
  Size get preferredSize => Size.fromHeight(BDeviceUtils.getAppBarHeight());
}
