import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/product_cart_horizontal.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class Subcatogaryscreen extends StatelessWidget {
  const Subcatogaryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(title: Text('Sport'),showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const BRoundImage(imageUrl: BImages.banner1,width: double.infinity,applyImageRadius: true,),
              const SizedBox(height: BSizes.spaceBtwSections,),
            ...List.generate(5, (i) =>
                Column(
                  children: [
                    BSectionHeading(title: 'Sports Shirt',onPressed: (){},),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        separatorBuilder: (_,__)=>const SizedBox(width: BSizes.spaceBtwItems,),
                        itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index)=> const BProductCardHorizontal(),
                      ),
                    ),
                    const SizedBox(height: BSizes.spaceBtwSections,)
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
