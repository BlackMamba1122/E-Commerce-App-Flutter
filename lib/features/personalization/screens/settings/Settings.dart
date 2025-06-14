import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/primary_header_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/settings/MenuTile.dart';
import 'package:flutter_application_1/features/personalization/controllers/settings_controller.dart';
import 'package:flutter_application_1/features/personalization/screens/address/UserAddressScreen.dart';
import 'package:flutter_application_1/features/shop/screens/cart/cart.dart';
import 'package:flutter_application_1/features/shop/screens/order/OrderScreen.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../AiScreen/ai.dart';
import '../../../../common/widgets/settings/UserProfil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SettingsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderConatiner(child: Column(
              children: [
                BAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: BColors.white),)),
                const BUserProfile(),
                const SizedBox(height: BSizes.spaceBtwSections,),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(BSizes.defaultSpace),
              child: Column(
                children: [
                  const BSectionHeading(title: 'Account Settings',showActionButton: false,),
                  const SizedBox(height: BSizes.spaceBtwItems,),
                  BSettingMenuTile (icon: Iconsax.safe_home, title: 'My Addresses', subtitle: 'Set shopping delivery address',onTap: ()=>Get.to(()=>const UserAddressScreen()),),
                  BSettingMenuTile (icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add, remove products and move to checkout',onTap: ()=>Get.to(()=>const CartScreen())),
                  BSettingMenuTile (icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress and Completed Orders',onTap: ()=>Get.to(()=>const Orderscreen())),
                  BSettingMenuTile (icon: Iconsax.airdrop, title: 'Chat', subtitle: 'Ask your Queries',onTap: ()=>Get.to(()=>const ChatScreen())),
                  // const BSettingMenuTile (icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account'),
                  // const BSettingMenuTile (icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons'),
                  // const BSettingMenuTile (icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message'),
                  // const BSettingMenuTile (icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),
                  /// App Settings
                  const SizedBox (height: BSizes.spaceBtwSections),
                  const BSectionHeading (title: 'App Settings', showActionButton: false),
                  const SizedBox(height: BSizes.spaceBtwItems),

                  BSettingMenuTile (icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase',onTap:(){}),
                  Obx(()
                    => BSettingMenuTile(
                      icon: Iconsax.moon,
                      title: 'Dark Mode',
                      subtitle: 'Set app Theme to dark or light',
                      trailing: Switch (value: controller.mode.value, onChanged: (val)=>controller.mode.value=val),
                    ),
                  ),
                  const SizedBox (height: BSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: ()=>controller.logoutAccountWarningPopup(),child: const Text('Logout')),
                  ),
                  const SizedBox (height: BSizes.spaceBtwSections*3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
