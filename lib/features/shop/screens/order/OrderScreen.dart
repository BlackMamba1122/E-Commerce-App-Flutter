import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_function.dart';

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
    final dark = BHelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_,__)=>const SizedBox(height: BSizes.spaceBtwItems,),
      itemCount: 9,
      itemBuilder: (_,index)=> CircleConatiner(
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
                      Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: BColors.primary,fontWeightDelta: 1)),
                      Text('07 Nov 2025',style: Theme.of(context).textTheme.headlineSmall,),
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
                            Text('OD1234',style: Theme.of(context).textTheme.titleMedium,),
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
                            Text('30 Feb 2031',style: Theme.of(context).textTheme.titleMedium,),
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
      ),
    );
  }
}
