import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shop/controllers/favourite_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/home/circular_Icon.dart';

class BFavouriteIcon extends StatelessWidget {
  const BFavouriteIcon({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());

    return Obx(() {
      return BCircluarIcon(
        icon: controller.isFavourite(id) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(id) ? Colors.red : null,
        onPressed: () => controller.toggleFavourite(id),
      );
    });
  }
}
