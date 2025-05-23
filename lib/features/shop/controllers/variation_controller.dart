import 'package:flutter_application_1/features/shop/controllers/image_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/models/product_variation_modle.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final SelectedAttribute = Map<String,dynamic>.from(selectedAttributes);
    SelectedAttribute[attributeName] = attributeValue;
    selectedAttributes[attributeName]=attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => isSameAttributValues(variation.attributeValues,SelectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    if(selectedVariation.image.isNotEmpty){
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }
    if(selectedVariation.id.isNotEmpty) {
      final cartController=CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }
    
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  bool isSameAttributValues(Map<String, dynamic> variationAttribute,Map<String, dynamic> selectedAttribute) {
    if(variationAttribute.length != selectedAttribute.length) {
      return false;
    }
    for(final key in variationAttribute.keys) {
      if(variationAttribute[key] != selectedAttribute[key]) {
        return false;
      }
    }
    return true;
  }

  Set<String?> getAttributeAvaliabilityVartiations(List<ProductVariationModel> variations,String attributeName) {
    final avaliableVariationAttributeValues = variations
        .where((variation) =>
          variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
    .map((variation)=>variation.attributeValues[attributeName])
    .toSet();

    return avaliableVariationAttributeValues;
  }

   getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price);
  }
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ?'In Stock' : 'Out of Stock';
  }
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }

  @override
  void onClose() {
    resetSelectedAttributes();
    super.onClose();
  }
}