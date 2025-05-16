import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/vertical_image_text.dart';
import 'package:flutter_application_1/features/shop/controllers/category_controller.dart';
import 'package:flutter_application_1/features/shop/screens/subCatogary/SubCatogaryScreen.dart';
import 'package:flutter_application_1/utils/CategoryShimmer.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CategoryController());

    return Obx(
      () {
        if(controller.isLoading.value) return const BCategoryShimmer();
        if(controller.featuredCategoies.isEmpty) {
          return Center(child: Text('No data found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: BColors.white),),);
        }
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.featuredCategoies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = controller.featuredCategoies[index];
                return VerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTop: () => Get.to(() => Subcatogaryscreen(category: category,)),
                );
              },
            ),
          );
        }
    );
  }
}
