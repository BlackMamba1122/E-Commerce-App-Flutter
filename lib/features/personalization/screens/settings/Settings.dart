import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/primary_header_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/settings/MenuTile.dart';
import 'package:flutter_application_1/features/personalization/screens/address/UserAddressScreen.dart';
import 'package:flutter_application_1/features/shop/screens/cart/cart.dart';
import 'package:flutter_application_1/features/shop/screens/order/OrderScreen.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/settings/UserProfil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const BSettingMenuTile (icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account'),
                  const BSettingMenuTile (icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons'),
                  const BSettingMenuTile (icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message'),
                  const BSettingMenuTile (icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),
                  /// App Settings
                  const SizedBox (height: BSizes.spaceBtwSections),
                  const BSectionHeading (title: 'App Settings', showActionButton: false),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  const BSettingMenuTile (icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase'),
                  BSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch (value: true, onChanged: (value) {}),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch (value: false, onChanged: (value) {}),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch (value: false, onChanged: (value) {}),
                  ),
                  const SizedBox (height: BSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){},child: const Text('Logout')),
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
