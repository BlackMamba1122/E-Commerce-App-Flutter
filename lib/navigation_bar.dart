import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/personalization/screens/settings/Settings.dart';
import 'package:flutter_application_1/features/shop/screens/home/home.dart';
import 'package:flutter_application_1/features/shop/screens/store/store.dart';
import 'package:flutter_application_1/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
      () => NavigationBar( 
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: dark ? BColors.black : BColors.white,
        indicatorColor: dark ? BColors.white.withOpacity(0.1) : BColors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
        ],
      ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens =[          
    const HomeScreen(),
    const Store(),
    const Wishlist(),
    const SettingScreen()
  ];
}