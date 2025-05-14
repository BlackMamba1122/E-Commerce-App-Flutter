import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circular_icon.dart';
import 'package:flutter_application_1/common/widgets/home/product_price.dart';
import 'package:flutter_application_1/common/widgets/home/product_title.dart';
import 'package:flutter_application_1/features/shop/models/cart_model.dart';
import 'package:flutter_application_1/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../utils/helpers/helper_function.dart';
import '../../../../utils/loaders/animation_loader.dart';
import '../../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: BAppBar(title: Text('Cart', style: Theme
          .of(context)
          .textTheme
          .headlineSmall,), showArrow: true,),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY. ',
          animation: BImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(BSizes.defaultSpace),
              child: CartItemBuilder(),
            ),
          );
        }
      }
      ),
      bottomNavigationBar: controller.cartItems.value.isEmpty ? SizedBox() :Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckOutScreen()),
          child: Obx(()=> Text('CheckOut  Rs.${controller.totalCartPrice.value}',)),
        ),
      ),
    );
  }
}

class CartItemBuilder extends StatelessWidget {
  const CartItemBuilder({
    super.key, this.ShowAddRemove = true,
  });

  final bool ShowAddRemove;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() =>
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
          const SizedBox(height: BSizes.spaceBtwSections,),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) =>
              Obx(() {
                final item = controller.cartItems[index];
                return Column(
                  children: [
                    CartItem(item: item),
                    if(ShowAddRemove)
                      const SizedBox(height: BSizes.spaceBtwItems,),
                    if(ShowAddRemove)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 70,),
                              QunatityAddRemove(quantity: item.quantity,
                                add: () => controller.addOneToCart(item),
                                remove: ()=>controller.removeOneFromCart(item)
                              ),
                            ],
                          ),
                          BProductPrice(price: NumberFormat('#,##0', 'en_US').format(item.price*item.quantity).toString())
                        ],
                      )
                  ],
                );
              }
              ),
        ),
    );
  }
}

class QunatityAddRemove extends StatelessWidget {
  const QunatityAddRemove({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BCircluarIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: BSizes.md,
          color: dark ? BColors.white : BColors.black,
          onPressed: remove,
          backgroundColor: dark ? BColors.darkerGrey : BColors.light,
        ),
        const SizedBox(width: BSizes.spaceBtwItems,),
        Text(quantity.toString(), style: Theme
            .of(context)
            .textTheme
            .titleSmall,),
        const SizedBox(width: BSizes.spaceBtwItems,),
        BCircluarIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: BSizes.md,
            color: BColors.white,
            onPressed: add,
            backgroundColor: BColors.primary
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        BRoundImage(
          imageUrl: item.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(BSizes.sm),
          background: dark ? BColors.darkerGrey : BColors.light,),
        const SizedBox(width: BSizes.spaceBtwItems,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BBrandTitle(title: item.brandName ?? '',),
              Flexible(child: BProductTitleText(
                title: item.title ?? '', maxLines: 1,)),
              Text.rich(
                  TextSpan(
                    children: (item.selectedVariation ?? {}).entries.map((e) =>
                        TextSpan(children: [
                          TextSpan(text: '${e.key}: ', style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,),
                          TextSpan(text: '${e.value}: ', style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge,),
                        ]
                        ),
                    ).toList(),
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
