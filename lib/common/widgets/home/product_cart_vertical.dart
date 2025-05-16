
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/product_price.dart';
import 'package:flutter_application_1/common/widgets/home/product_title.dart';
import 'package:flutter_application_1/common/widgets/home/shadow.dart';
import 'package:flutter_application_1/features/shop/controllers/cart_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/product_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/screens/detailProduct/product_deatil.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../features/shop/screens/wishlist/favourite_icon.dart';

class BProductCardVertical extends StatelessWidget {
  const BProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercent=controller.calculateSalePercentage(product.price, product.salePrice);
    final dark =BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDeatil(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(BSizes.productImageRadius),
          color: dark ? BColors.darkerGrey : BColors.white
        ),
        child: Column(
          children: [
            CircleConatiner(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(BSizes.sm),
              backgroundColor: dark ? BColors.dark : BColors.light,
              child: Stack(
                children: [
                  BRoundImage(imageUrl: product.thumbnail,isNetworkImage: true,),
                  Positioned(
                    top: 12,
                    child: CircleConatiner(
                      radius: BSizes.sm,
                      backgroundColor: BColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: BSizes.sm,vertical: BSizes.xs),
                      child: Text('$salePercent%',style: Theme.of(context).textTheme.labelLarge!.apply(color: BColors.black),),
                    ),
                  ),
                  BFavouriteIcon(id: product.id),
                ],
              )
            ),
            const SizedBox(height: BSizes.spaceBtwItems/2),
             Padding(
            padding: const EdgeInsets.only(left: BSizes.sm),
            child: SizedBox(
              width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BProductTitleText(title: product.title,smallSize: true,),
                const SizedBox(height: BSizes.spaceBtwItems/2),
                BBrandTitle(title: product.brand!.name),
              ],
            ),
            ),
            ),
            const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: BSizes.sm),
                                child: Text(
                                NumberFormat('#,##0', 'en_US').format(product.price),
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: BSizes.sm),
                            child: BProductPrice(price: controller.getProductPrice(product)),
                          ),
                        ],
                      ),
                    ),
                    ProductAddToCartButton(product: product,)
                  ],
                )
          ],
        ),
      ),
    );
  }
}

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({
    super.key, required this.product,
  });
final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }else {
          Get.to(()=>ProductDeatil(product: product));
        }
      },
      child: Obx(()
        {
          final quantity=cartController.getProductQuantityInCart(product.id);
          bool isQuantity = quantity>0;
          return Container(
            decoration: BoxDecoration(
                color: isQuantity ? BColors.primary : BColors.dark,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(BSizes.cardRadiusMd),
                  bottomRight: Radius.circular(BSizes.productImageRadius),
                )
            ),
            child: SizedBox(
                width: BSizes.iconLg*1.2,
                height: BSizes.iconLg*1.2,
                child: Center(child: isQuantity
                    ? Text(quantity.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: BColors.white),)
                    :const Icon(Iconsax.add,color: BColors.white)
                )
            ),
          );
        }
      ),
    );
  }
}