import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

import '../../../../common/widgets/store/b_brand_cart.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BAppBar(title: Text('Nike'), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              BBrandCart(showBorder: true,),
              SizedBox(height: BSizes.spaceBtwSections,),
              SortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}