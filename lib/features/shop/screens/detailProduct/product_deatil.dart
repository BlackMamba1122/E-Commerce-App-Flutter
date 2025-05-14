import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/b_brand_title_with_icon.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circular_Icon.dart';
import 'package:flutter_application_1/common/widgets/home/curved_edge_widget.dart';
import 'package:flutter_application_1/common/widgets/home/product_price.dart';
import 'package:flutter_application_1/common/widgets/home/product_title.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/store/b_circular_image.dart';
import 'package:flutter_application_1/features/shop/controllers/cart_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/image_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/product_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/variation_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/screens/productreview/product_review.dart';
import 'package:flutter_application_1/features/shop/screens/wishlist/favourite_icon.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/home/circle_conatiner.dart';

class ProductDeatil extends StatelessWidget {
  const ProductDeatil({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddtoCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: BSizes.defaultSpace,
                  left: BSizes.defaultSpace,
                  bottom: BSizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShare(),
                  ProductMetaData(product: product),
                  if(product.productType == ProductType.variable.toString())
                    ProductAttributes(product: product),
                  //checkout
                  if(product.productType == ProductType.variable.toString())
                  const SizedBox(
                    height: BSizes.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('CheckOut'))
                  ),
                  //description
                  const SizedBox(
                    height: BSizes.spaceBtwSections,
                  ),
                  //description
                  const BSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: BSizes.spaceBtwItems,
                  ),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: ' show less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
                  ),
                  //review
                  const Divider(),
                  const SizedBox(
                    height: BSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BSectionHeading(
                        title: 'Reviews(123)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>Get.to(()=>const ProductReview()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: BSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: BSizes.spaceBtwItems,
                  ),
                  const ARButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ARButton extends StatelessWidget {
  const ARButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.cyanAccent],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.6),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          alignment: Alignment.center,
          child: const Text(
            'Launch AR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: BSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0 ', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(1999)')
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: BSizes.iconMd,
            ))
      ],
    );
  }
}

class BProductImageSlider extends StatelessWidget {
  const BProductImageSlider({
    super.key, required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
  final controller=Get.put(ImageController());
  final images=controller.getallProductImage(product);
    final dark = BHelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? BColors.darkerGrey : BColors.light,
        child: Stack(
          children: [
             SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(BSizes.productImageRadius * 2),
                  child: Center(
                      child: Obx(() {
                        final image=controller.selectedProductImage.value;
                        return GestureDetector(
                          onTap: ()=>controller.showEnlargedImage(image),
                            child: CachedNetworkImage(imageUrl: image,progressIndicatorBuilder: (_,__,downloadProgress)=>CircularProgressIndicator(value: downloadProgress.progress,color: BColors.primary),));
                  }),
                ),),
             ),
            Positioned(
              right: 0,
              bottom: 30,
              left: BSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(()
                   {
                     final imageSelected=controller.selectedProductImage.value==images[index];
                   return BRoundImage(
                     width: 80,
                     isNetworkImage: true,
                     background: dark ? BColors.grey : BColors.white,
                   imageUrl: images[index],
                   border: Border.all(color: imageSelected ? BColors.primary : Colors.transparent),
                   padding: const EdgeInsets.all(BSizes.sm),
                     onPressed: ()=>controller.selectedProductImage.value=images[index],
                   );},
                  )),
                ),
              ),
             BAppBar(
              showArrow: true,
              actions: [
                BFavouriteIcon(id: product.id),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleConatiner(
              radius: BSizes.sm,
              backgroundColor: BColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: BSizes.sm, vertical: BSizes.xs),
              child: Text(
                '${controller.calculateSalePercentage(product.price, product.salePrice)}%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: BColors.black),
              ),
            ),
            const SizedBox(
              width: BSizes.spaceBtwItems,
            ),
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
              Text(
    NumberFormat('#,##0', 'en_US').format(product.price),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
            const SizedBox(
              width: BSizes.spaceBtwItems,
            ),
             BProductPrice(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: BSizes.spaceBtwItems / 1.5,
        ),
        BProductTitleText(title: product.title),
        const SizedBox(
          height: BSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const BProductTitleText(title: 'Status'),
            const SizedBox(
              width: BSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: BSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            BCircularImage(
              image: product.brand !=null ? product.brand!.image : '',
              isNetworkImage: true,
              width: 32,
              height: 32,
              overlayColor: dark ? BColors.white : BColors.black,
            ),
             BBrandTitle(
              title: product.brand !=null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
final controller=Get.put(VariationController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Obx(()
      => Column(
        children: [
          if(controller.selectedVariation.value.id.isNotEmpty)
          CircleConatiner(
            padding: const EdgeInsets.all(BSizes.md),
            backgroundColor: dark ? BColors.darkerGrey : BColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const BSectionHeading(
                      title: 'Variations',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      width: BSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const BProductTitleText(
                              title: 'Price : ',
                              smallSize: false,
                            ),
                            const SizedBox(
                              width: BSizes.spaceBtwItems,
                            ),
                            if(controller.selectedVariation.value.salePrice>0)
                            Text(
                              NumberFormat('#,##0', 'en_US').format(controller.selectedVariation.value.salePrice),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: BSizes.spaceBtwItems,
                            ),
                             BProductPrice(
                              price: NumberFormat('#,##0', 'en_US').format(controller.getVariationPrice()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const BProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                 BProductTitleText(
                  title:
                      controller.selectedVariation.value.description.toString(),
                  maxLines: 4,
                  smallSize: true,
                )
              ],
            ),
          ),
          const SizedBox(
            height: BSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute)=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BSectionHeading(
                  title: attribute.name ?? '',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: BSizes.spaceBtwItems / 2,
                ),
                Obx(()
                  => Wrap(
                    spacing: 8,
                    children: attribute.values!.map((value) {
                      final isSelected = controller.selectedAttributes[attribute.name] == value;
                      final avaliable = controller.getAttributeAvaliabilityVartiations(product.productVariations!,attribute.name!).contains(value);

                      return BChoiceChip(
                        text: value,
                        selected: isSelected,
                        onSelected: avaliable ? (selected) {
                        if(selected && avaliable) {
                          controller.onAttributeSelected(product,attribute.name ?? '',value);
                        }
                      }:null);
                      }).toList(),

                  ),
                ),
              ],
            ),).toList(),
          ),
        ],
      ),
    );
  }
}

class BChoiceChip extends StatelessWidget {
  const BChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: BHelperFunctions.getColor(text) != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? BColors.white : null),
        avatar: BHelperFunctions.getColor(text) != null
            ? CircleConatiner(
                width: 50,
                height: 50,
                backgroundColor: BHelperFunctions.getColor(text)!,
              )
            : null,
        shape: BHelperFunctions.getColor(text) != null ? const CircleBorder() : null,
        labelPadding:
            BHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        padding:
            BHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        backgroundColor: BHelperFunctions.getColor(text),
      //      selectedColor: BHelperFunctions.getColor(text) != null ? Colors.green : null,
      ),
    );
  }
}

class BottomAddtoCart extends StatelessWidget {
  const BottomAddtoCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: BSizes.defaultSpace, vertical: BSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? BColors.darkerGrey : BColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(BSizes.cardRadiusLg),
            topRight: Radius.circular(BSizes.cardRadiusLg),
          )),
      child: Obx(()
        => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Row(
                children: [
                   BCircluarIcon(
                    icon: Iconsax.minus,
                    backgroundColor: BColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: BColors.white,
                    onPressed: controller.productQuantityInCart.value <1?null:()=>controller.productQuantityInCart--,
                  ),
                  const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                   BCircluarIcon(
                    icon: Iconsax.add,
                    backgroundColor: BColors.black,
                    width: 40,
                    height: 40,
                    color: BColors.white,
                    onPressed: ()=>controller.productQuantityInCart++,
                  ),
                ],
              ),
            ElevatedButton(
                onPressed:controller.productQuantityInCart<1 ? null : ()=>controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(BSizes.md),
                backgroundColor: BColors.black,
                side: const BorderSide(color: BColors.black),
              ),
                child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
