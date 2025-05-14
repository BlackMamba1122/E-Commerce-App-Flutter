import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shop/controllers/cart_controller.dart';
import 'package:flutter_application_1/features/shop/screens/cart/cart.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor = BColors.black,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? BColors.white : BColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(()
                => Text(controller.noOfCartItems.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (dark ? BColors.black : BColors.white),
                        fontSizeFactor: 0.8)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
