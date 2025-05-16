import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/features/shop/controllers/brand_controller.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/VerticalProductShimmer.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/store/b_brand_cart.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: BAppBar(title: Text(brand.name), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              BBrandCart(showBorder: true, brand: brand,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader=BVerticalProductShimmer();
                  final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget!=null) return widget;
                  final brandProducts=snapshot.data!;
                  return SortableProduct(products: brandProducts,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}