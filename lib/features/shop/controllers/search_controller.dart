import 'package:flutter_application_1/features/shop/controllers/product_controller.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class SearchProductController extends GetxController {
  static SearchProductController get instance => Get.find();

  List<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  final RxString query = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    allProducts = await ProductController.instance.fetchAllProducts();
    // filteredProducts.assignAll(allProducts);
  }

  void search(String input) {
    query.value = input;
    if (input.isEmpty) {
      filteredProducts.clear();
    } else {
      filteredProducts.assignAll(allProducts.where((p) =>
          p.title.toLowerCase().contains(input.toLowerCase())));
    }
  }
}
