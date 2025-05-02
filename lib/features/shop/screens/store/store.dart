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
import 'package:flutter_application_1/features/shop/controllers/category_controller.dart';
import 'package:flutter_application_1/features/shop/models/category_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/allBrand.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories=CategoryController.instance.featuredCategoies;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: BAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            CartCounterIcon(onPressed: (){})
          ],
        ),
        body: NestedScrollView(headerSliverBuilder:(_, innerBoxIsScrollable) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: BHelperFunctions.isDarkMode(context) ? BColors.black : BColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(BSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: BSizes.spaceBtwItems,),
                    const BSearchBar(),
                    const SizedBox(height: BSizes.spaceBtwSections,),
                    BSectionHeading(title: 'Features Brand',onPressed: ()=>Get.to(()=>const AllBrandScreen())),
                    const SizedBox(height: BSizes.spaceBtwItems/1.5,),
                    BGridViewLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_,index){
                      return BBrandCart(showBorder: true,onTap: (){},);
                    }),
      
                  ],
                ),
                ),
                bottom: BTabBar(
                  tabs: categories.map((category)=>Tab(child: Text(category.name))).toList(),
                ),
                )
          ]; 
          }, 
          body: TabBarView(
            children: categories.map((category)=>BCategoryTab(category: category)).toList(),
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
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: Column(
          children: [
            const BBrandShowCase(images: [BImages.productImage2,BImages.productImage3,BImages.productImage1]),
            const SizedBox(height: BSizes.spaceBtwItems),
            const BBrandShowCase(images: [BImages.productImage2,BImages.productImage3,BImages.productImage1]),
            const SizedBox(height: BSizes.spaceBtwItems),
            BSectionHeading(title: 'You Might Like',showActionButton: true,onPressed: (){}),
            const SizedBox(height: BSizes.spaceBtwItems),
            BGridViewLayout(itemCount: 4, itemBuilder: (_,index)=>const BProductCardVertical()),
            const SizedBox(height: BSizes.spaceBtwSections),
          ],
        ),
      ),
      ]
    );
  }
}



