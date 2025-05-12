import 'package:flutter_application_1/data/repositories/brand_repository.dart';
import 'package:flutter_application_1/data/repositories/product_repository.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxBool isLoading = true.obs;
  final brandRepository= Get.put(BrandRepository());

  @override
  void onInit() {
    getFeatureBrands();
    super.onInit();
  }

  Future<void> getFeatureBrands() async {
    try {
      isLoading.value = true;
      final brands= await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    }catch (e) {
      BLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId,int limit=-1}) async {
    try {
      final products=await ProductRepository.instance.getProductForBrand(brandId: brandId,limit: limit);
      return products;
    }catch(e) {
      BLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands=await brandRepository.getBrandForCategory(categoryId);
      return brands;
    }catch(e) {
      BLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
      return [];
    }
  }
}