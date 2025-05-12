import 'package:flutter_application_1/data/repositories/category_repository.dart';
import 'package:flutter_application_1/data/repositories/product_repository.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategoies = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategoies.assignAll(
          allCategories.where((categories) => categories.isFeatured &&
              categories.parentId.isEmpty).take(8).toList());
    } catch (e) {
      BLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance.getProductForCategory(
          categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      BLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  Future<List<CategoryModel>> getSubCategory(String categoryId) async {
    try {
      final categories = await _categoryRepository.getSubCategories(categoryId);
      return categories;
    } catch (e) {
      BLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

}