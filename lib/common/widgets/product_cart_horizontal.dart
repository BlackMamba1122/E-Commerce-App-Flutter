
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/circular_Icon.dart';
import 'package:flutter_application_1/common/widgets/home/product_price.dart';
import 'package:flutter_application_1/common/widgets/home/product_title.dart';
import 'package:flutter_application_1/features/shop/controllers/product_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/screens/detailProduct/product_deatil.dart';
import 'package:flutter_application_1/features/shop/screens/wishlist/favourite_icon.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BProductCardHorizontal extends StatelessWidget {
  const BProductCardHorizontal({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    final dark =BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=> ProductDeatil(product: ProductModel.empty(),)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BSizes.productImageRadius),
            color: dark ? BColors.darkerGrey : BColors.softGrey
        ),
        child: Row(
          children: [
            CircleConatiner(
                height: 120,
                padding: const EdgeInsets.all(BSizes.sm),
                backgroundColor: dark ? BColors.dark : BColors.light,
                child: Stack(
                  children: [
                     SizedBox(height: 120,width: 120,child: BRoundImage(imageUrl: product.thumbnail,isNetworkImage: true,applyImageRadius: true,)),
                    Positioned(
                      top: 0,
                      child: CircleConatiner(
                        radius: BSizes.sm,
                        backgroundColor: BColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: BSizes.sm,vertical: BSizes.xs),
                        child: Text('$salePercentage%',style: Theme.of(context).textTheme.labelLarge!.apply(color: BColors.black),),
                      ),
                    ),
                    Positioned(top: 0,right: 0, child: BFavouriteIcon(id: product.id,)),
                  ],
                )
            ),
            // const SizedBox(height: BSizes.spaceBtwItems/2),
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: BSizes.sm,left: BSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BProductTitleText(title: product.title,smallSize: true,),
                        SizedBox(height: BSizes.spaceBtwItems/2),
                        BBrandTitle(title: product.brand!.name),
                      ],
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
                                  padding: EdgeInsets.only(left: BSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.only(left: BSizes.sm),
                                child: BProductPrice(price: controller.getProductPrice(product)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(BSizes.cardRadiusMd),
                                bottomRight: Radius.circular(BSizes.productImageRadius),
                              )
                          ),
                          child: const SizedBox(
                              width: BSizes.iconLg*1.2,
                              height: BSizes.iconLg*1.2,
                              child: Center(child: Icon(Iconsax.add,color: BColors.white))
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(left: BSizes.sm),
            //       child: BProductPrice(price: '1234'),
            //     ),
//              ],
//            )
          ],
        ),
      ),
    );
  }
}

