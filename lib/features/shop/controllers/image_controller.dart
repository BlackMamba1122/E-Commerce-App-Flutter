import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance=> Get.find();
  RxString selectedProductImage = ''.obs;

  List<String> getallProductImage(ProductModel product) {
    Set<String> images={};
    images.add(product.thumbnail);
    selectedProductImage.value=product.thumbnail;
    if(product.images!=null) {
      images.addAll(product.images!);
    }
    if(product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((i)=>i.image));
    }
    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        ()=>Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: BSizes.defaultSpace*2,horizontal: BSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image,),
              ),
              const SizedBox(height: BSizes.spaceBtwSections,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(width: 150,child: OutlinedButton(onPressed: ()=>Get.back(),child: const Text('Close'),),),
              )
            ],
          ),
        )
    );
  }
}