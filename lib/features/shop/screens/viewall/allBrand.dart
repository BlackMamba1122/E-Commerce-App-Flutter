import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/features/shop/controllers/brand_controller.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/brand_product.dart';
import 'package:flutter_application_1/utils/brand_shimmer.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/store/b_brand_cart.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: const BAppBar(title: Text('Brands'), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const BSectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              Obx(()
              {
                if(controller.isLoading.value) {
                  return BBrandShimmer(itemCount: controller.allBrands.length);
                }
                if(controller.allBrands.isEmpty) {
                  return Center(child: Text('No Brands Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: BColors.white)));
                }
                return BGridViewLayout(itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand=controller.allBrands[index];

                      return BBrandCart(
                        brand: brand,
                        showBorder: true, onTap: () =>Get.to(()=>BrandProduct(brand: brand,)),);
                    });
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
