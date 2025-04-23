import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circular_icon.dart';
import 'package:flutter_application_1/common/widgets/home/product_price.dart';
import 'package:flutter_application_1/common/widgets/home/product_title.dart';
import 'package:flutter_application_1/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_function.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: BAppBar(title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),showArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(BSizes.defaultSpace),
        child: CartItemBuilder(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=>Get.to(()=>const CheckOutScreen()),
          child: const Text('CheckOut  Rs.8000',),
        ),
      ),
    );
  }
}

class CartItemBuilder extends StatelessWidget {
  const CartItemBuilder({
    super.key, this.ShowAddRemove=true,
  });
  final bool ShowAddRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        separatorBuilder: (_,__)=>const SizedBox(height: BSizes.spaceBtwSections,),
        itemCount: 2,
        itemBuilder: (_,index)=> Column(
          children: [
            const CartItem(),
            if(ShowAddRemove)
              const SizedBox(height: BSizes.spaceBtwItems,),
            if(ShowAddRemove)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      Row(
                        children: [
                          SizedBox(width: 70,),
                          QunatityAddRemove(),
                        ],
                      ),
                  BProductPrice(price: '2000')
                ],
              )
          ],
        ),
    );
  }
}

class QunatityAddRemove extends StatelessWidget {
  const QunatityAddRemove({
    super.key,
  });

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
          color: dark?BColors.white:BColors.black,
          backgroundColor: dark ? BColors.darkerGrey : BColors.light,
        ),
        const SizedBox(width: BSizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: BSizes.spaceBtwItems,),
        const BCircluarIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: BSizes.md,
          color: BColors.white,
          backgroundColor: BColors.primary
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        BRoundImage(imageUrl: BImages.productImage1,width: 60,height: 60,padding: const EdgeInsets.all(BSizes.sm),background: dark ? BColors.darkerGrey : BColors.light,),
        const SizedBox(width: BSizes.spaceBtwItems,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BBrandTitle(title: 'Shoes',),
              const Flexible(child: BProductTitleText(title: 'Blue Shoes',maxLines: 1,)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '34 ',style: Theme.of(context).textTheme.bodyLarge),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}
