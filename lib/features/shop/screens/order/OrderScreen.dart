import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../navigation_bar.dart';
import '../../../../utils/constants/imge_string.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../../utils/loaders/animation_loader.dart';
import '../../controllers/order_controller.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall),showArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(BSizes.defaultSpace),
        child: OrderList(),
      ),
    );
  }
}


class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
    final dark = BHelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: BImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;
        /// Congratulations es Record found.
        final orders = snapshot.data !;
        return ListView.separated(
          separatorBuilder: (_,__)=>const SizedBox(height: BSizes.spaceBtwItems,),
          itemCount: orders.length,
          itemBuilder: (_,index) {
            final order = orders[index];
            return
            CircleConatiner(
                showBorder: true,
                padding: const EdgeInsets.all(BSizes.md),
            backgroundColor: dark ? BColors.dark : BColors.light,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Row(
            children: [
            const Icon(Iconsax.ship),
            const SizedBox(width: BSizes.spaceBtwItems/2,),
            Expanded(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(order.orderStatusText,style: Theme.of(context).textTheme.bodyLarge!.apply(color: BColors.primary,fontWeightDelta: 1)),
                          Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall,),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: BSizes.iconSm,)),
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwItems,),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order',style: Theme.of(context).textTheme.labelMedium),
                                Text(order.id,style: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: BSizes.spaceBtwItems/2,),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shipping',style: Theme.of(context).textTheme.labelMedium),
                                Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
      }
        );
      }
    );
  }
}
