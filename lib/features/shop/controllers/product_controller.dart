import 'package:flutter_application_1/data/repositories/product_repository.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance =>Get.find();

  final isLoading =false.obs;
  RxList<ProductModel> featuredProducts=<ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts()async{
    try{
      isLoading.value=true;
      final products=await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
    }catch(e) {
      BLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }finally {
     isLoading.value=false;
    }
  }

  Future<List<ProductModel>> fetchAllProducts()async{
    try{
      final products=await productRepository.getAllFeaturedProducts();
      return products;
    }catch(e) {
      BLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product){
    double smallestPrice=double.infinity;
    double largestPrice=0.0;
    if(product.productType == ProductType.single.toString()){
     return (product.salePrice>0 ? product.salePrice : product.price).toString();
    }
    else {
        for(var variation in product.productVariations!) {
          double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;
          if(priceToConsider < smallestPrice)
            smallestPrice=priceToConsider;
          if(priceToConsider > largestPrice)
            largestPrice=priceToConsider;
        }
      }
    if(smallestPrice==largestPrice) {
      return largestPrice.toString();
    }
    else {
      return '$smallestPrice - $largestPrice';
    }
  }
  String? calculateSalePercentage(double originalPrice,double? salePrice) {
    if(salePrice == null || salePrice <= 0) return null;
    if(originalPrice<=0)return null;
    double percentge=((originalPrice-salePrice)/originalPrice)*100;
    return percentge.toStringAsFixed(0);
  }
  String getProductStockStatus(int stock) {
    return stock >0 ? 'In Stock' : 'Out of Stock';
  }
}