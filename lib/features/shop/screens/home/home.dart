import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/primary_header_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/common/widgets/home/search_bar.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/features/shop/controllers/product_controller.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_app_bar.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_categories.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_slider.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/VerticalProductShimmer.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const PrimaryHeaderConatiner(
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(height: BSizes.spaceBtwSections),
                BSearchBar(),
                SizedBox(height: BSizes.spaceBtwSections),
                Padding(
                  padding: EdgeInsets.only(left: BSizes.defaultSpace),
                  child: Column(
                    children: [
                      BSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: BColors.white,
                      ),
                      SizedBox(height: BSizes.spaceBtwItems),
                      HomeCategory(),
                      SizedBox(
                        height: BSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(BSizes.defaultSpace),
              child: Column(
                children: [
                  const BPromoSlider(),
                  const SizedBox(height: BSizes.spaceBtwSections),
                  BSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => ViewallScreen(
                      title: 'Popular Product',
                      // query: FirebaseFirestore.instance.collection('Products').where('IsFeatured',isEqualTo: true).limit(6),
                      futureMethod: controller.fetchAllProducts(),
                    )),
                  ),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const BVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text(
                        'No data',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ));
                    } else {
                      return BGridViewLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => BProductCardVertical(
                              product: controller.featuredProducts[index]));
                    }
                  }),
                ],
              ))
        ]),
      ),
    );
  }
}
