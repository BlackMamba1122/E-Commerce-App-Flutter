import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/brand_product.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/store/b_brand_cart.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(title: Text('Brands'), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const BSectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              BGridViewLayout(
                mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_,index)=>BBrandCart(showBorder: true,onTap: ()=>Get.to(()=>const BrandProduct())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
