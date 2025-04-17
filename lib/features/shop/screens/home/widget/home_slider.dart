import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/b_round_image.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/features/shop/controllers/home_controller.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class BPromoSlider extends StatelessWidget {
  const BPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
  final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url)=> BRoundImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index,_)=>controller.updatePageindicator(index)
          )
          ),
          const SizedBox(height: BSizes.spaceBtwItems),
          Center(
            child: Obx(
              ()=> Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length;i++)
                    CircleConatiner(width: 20, height: 4,margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carousalCurrentIndex.value == i ? BColors.primary : BColors.grey)
                ],
              ),
            ),
          ),  
          
    
      ],
    );
  }
}
