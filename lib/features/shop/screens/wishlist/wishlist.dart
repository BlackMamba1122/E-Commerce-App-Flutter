import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circular_icon.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/features/shop/controllers/favourite_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/utils/VerticalProductShimmer.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/utils/loaders/animation_loader.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: BAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          BCircluarIcon(
              icon: Iconsax.add,
              onPressed: () {
                final controller = Get.find<NavigationController>();
                controller.selectedIndex.value = 0;
                Get.back();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                      text: 'WishList is Empty',
                      animation: BImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Lets add some',
                      onActionPressed: () {
                            final controller = Get.find<NavigationController>();
                            controller.selectedIndex.value = 0;
                            Get.back();
                          });
                  const loader = BVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return BGridViewLayout(
                      itemCount: controller.favourites.length,
                      itemBuilder: (_, index) => BProductCardVertical(
                            product: products[index],
                          ));
                }),
          ),
        ),
      ),
    );
  }
}
