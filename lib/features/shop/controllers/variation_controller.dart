import 'package:flutter_application_1/features/shop/controllers/image_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/models/product_variation_modle.dart';
import 'package:get/get.dart';

class VariationCobtroller extends GetxController {
  static VariationCobtroller get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final SelectedAttribute = Map<String,dynamic>.from(this.selectedAttributes);
    SelectedAttribute[attributeName] = attributeValue;
    this.selectedAttributes[attributeName]=attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => isSameAttributValues(variation.attributeValues,SelectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    if(selectedVariation.image.isNotEmpty){
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
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

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ?'In Stock' : 'Out of Stock';
  }
  void ResetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }
}