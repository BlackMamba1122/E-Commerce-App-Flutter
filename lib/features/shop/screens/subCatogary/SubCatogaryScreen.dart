import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/product_cart_horizontal.dart';
import 'package:flutter_application_1/features/shop/controllers/category_controller.dart';
import 'package:flutter_application_1/features/shop/models/category_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/utils/horizontal_product_shimmer.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class Subcatogaryscreen extends StatelessWidget {
  const Subcatogaryscreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      appBar: BAppBar(
        title: Text(category.name),
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const BRoundImage(
                imageUrl: BImages.banner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: BSizes.spaceBtwSections,
              ),
              FutureBuilder(
                  future: controller.getSubCategory(category.id),
                  builder: (context, snapshot) {
                    const loader = HorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {

                              final widget = TCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  BSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () =>Get.to(() => ViewallScreen(title: subCategory.name,futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1))),
                                  ),
                                  const SizedBox(
                                    height: BSizes.spaceBtwItems / 2,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      separatorBuilder: (_, __) => const SizedBox(
                                        width: BSizes.spaceBtwItems,
                                      ),
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) =>
                                           BProductCardHorizontal(product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: BSizes.spaceBtwSections,
                                  )
                                ],
                              );
                            }
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
