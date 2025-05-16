import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/store/b_brand_cart.dart';
import 'package:flutter_application_1/common/widgets/store/b_brand_show_case.dart';
import 'package:flutter_application_1/common/widgets/appbar/cart_menu_icon.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/common/widgets/home/search_bar.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/store/tabbar.dart';
import 'package:flutter_application_1/features/shop/controllers/brand_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/category_controller.dart';
import 'package:flutter_application_1/features/shop/models/category_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/allBrand.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/brand_product.dart';
import 'package:flutter_application_1/utils/VerticalProductShimmer.dart';
import 'package:flutter_application_1/utils/box_shimmer.dart';
import 'package:flutter_application_1/utils/brand_shimmer.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:flutter_application_1/utils/list_tile_shimmer.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategoies;
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
            appBar: BAppBar(
              title: Text('Store', style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,),
              actions: const [
                CartCounterIcon(iconColor: BColors.white,counterBgColor: BColors.black,counterTextColor: BColors.white,)
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrollable) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: BHelperFunctions.isDarkMode(context)
                        ? BColors.black
                        : BColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(BSizes.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: BSizes.spaceBtwItems,),
                          const BSearchBar(),
                          const SizedBox(height: BSizes.spaceBtwSections,),
                          BSectionHeading(title: 'Features Brand',
                              onPressed: () =>
                                  Get.to(() => const AllBrandScreen())),
                          const SizedBox(height: BSizes.spaceBtwItems / 1.5,),
                          Obx(()
                            {
                              if(brandController.isLoading.value) {
                                return BBrandShimmer(itemCount: brandController.featureBrands.length);
                              }
                              if(brandController.featureBrands.isEmpty) {
                                return Center(child: Text('No Brands Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: BColors.white)));
                              }
                              return BGridViewLayout(itemCount: brandController.featureBrands.length,
                                  mainAxisExtent: 80,
                                  itemBuilder: (_, index) {
                                final brand=brandController.featureBrands[index];

                                    return BBrandCart(
                                      brand: brand,
                                      showBorder: true, onTap: ()=> Get.to(()=>BrandProduct(brand: brand)),);
                                  });
                            }
                          ),

                        ],
                      ),
                    ),
                    bottom: BTabBar(
                      tabs: categories.map((category) =>
                          Tab(child: Text(category.name))).toList(),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: categories.map((category) =>
                    BCategoryTab(category: category)).toList(),
              ),
            )
        )
    );
  }
}

class BCategoryTab extends StatelessWidget {
  const BCategoryTab({
    super.key, required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller=CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category,),
              const SizedBox(height: BSizes.spaceBtwItems),
              Column(
                children: [
                  BSectionHeading(title: 'You Might Like',
                      showActionButton: true,
                      onPressed: () =>Get.to(()=>ViewallScreen(title: category.name,futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1)))),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  FutureBuilder(
                    future: controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      final widget=TCloudHelperFunctions.checkMultiRecordState(loader: const BVerticalProductShimmer(), snapshot: snapshot);
                      if(widget !=null) return widget;
                      final products=snapshot.data!;
                      return BGridViewLayout(itemCount: products.length,
                          itemBuilder: (_, index) =>
                              BProductCardVertical(product: products[index]));
                    }
                  ),
                ],
              ),
              //const SizedBox(height: BSizes.spaceBtwSections),
            ],
          ),
        ),
        ]
    );
  }
}

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key, required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        const Loader=Column(
          children: [
            BListTileShimmer(),
            SizedBox(height: BSizes.spaceBtwItems,),
            BBoxesShimmer(),
            SizedBox(height: BSizes.spaceBtwItems,),
          ],
        );
        final widget=TCloudHelperFunctions.checkMultiRecordState(loader: Loader, snapshot: snapshot);
        if(widget !=null) return widget;
        final brands=snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index){
            final brand=brands[index];
        return FutureBuilder(
          future: controller.getBrandProducts(brandId: brand.id,limit: 3),
          builder: (context, snapshot) {
            final widget=TCloudHelperFunctions.checkMultiRecordState(loader: Loader, snapshot: snapshot);
            if(widget !=null) return widget;
            final products=snapshot.data!;
            return BBrandShowCase(
              images: products.map((product) => product.thumbnail).toList(),
              brand: brand,);
          }
        );
          }
        );
      }
    );
  }
}



