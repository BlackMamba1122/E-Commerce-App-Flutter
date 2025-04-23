import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/primary_header_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/common/widgets/home/search_bar.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_app_bar.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_categories.dart';
import 'package:flutter_application_1/features/shop/screens/home/widget/home_slider.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderConatiner(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: BSizes.spaceBtwSections),
                  BSearchBar(),
                  SizedBox(height: BSizes.spaceBtwSections),
                  Padding(padding: EdgeInsets.only(left: BSizes.defaultSpace),
                    child: Column(
                      children: [
                        BSectionHeading(title: 'Popular Categories',showActionButton: false,textColor: BColors.white,),
                        SizedBox(height: BSizes.spaceBtwItems),
                        HomeCategory(),
                        SizedBox(height: BSizes.spaceBtwSections,),
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
                  const BPromoSlider(banners: [BImages.promoBanner1,BImages.promoBanner2,BImages.promoBanner3],),
                  const SizedBox(height: BSizes.spaceBtwSections),
                  BSectionHeading(title: 'Popular Products',onPressed: ()=>Get.to(()=>const ViewallScreen()),),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  BGridViewLayout(itemCount: 10, itemBuilder: (_,index) => const BProductCardVertical()),
                ],
              )
            )
          ]
        ),
      ),
    );
  }
}

