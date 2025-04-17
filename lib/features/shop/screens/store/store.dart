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
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                    BSectionHeading(title: 'Features Brand',onPressed: (){}),
                    const SizedBox(height: BSizes.spaceBtwItems/1.5,),
                    BGridViewLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_,index){
                      return BBrandCart(showBorder: true,onTap: (){},);
                    }),
      
                  ],
                ),
                ),
                bottom: const BTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electonics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmatics')),
                  ]),
                )
          ]; 
          }, 
          body: const TabBarView(
            children: [
              BCategoryTab(),
              BCategoryTab(),
              BCategoryTab(),
              BCategoryTab(),
              BCategoryTab(),
            ],
          )),
      ),
    );
  }
}

class BCategoryTab extends StatelessWidget {
  const BCategoryTab({
    super.key,
  });

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



