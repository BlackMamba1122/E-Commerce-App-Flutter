import 'dart:convert';

import 'package:flutter_application_1/data/repositories/product_repository.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/local_storage/storage_utility.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites=<String,bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  Future<void> initFavourite() async{
    final json=BLocalStorage.instance().readData<String>('favourites');
    if(json!=null){
      final storedFavourites=jsonDecode(json) as Map<String,dynamic>;
      favourites.assignAll(storedFavourites.map((key,value)=>MapEntry(key,value as bool)));
    }
  }

  bool isFavourite(String id){
    return favourites[id]??false;
  }

  void toggleFavourite(String id){
    if(!favourites.containsKey(id)) {
      favourites[id]=true;
      favourites.refresh();
      saveFavouritestToStorage();
      BLoaders.customToast(message: 'Added to favourites');
    }
    else {
      BLocalStorage.instance().removeData(id);
      favourites.remove(id);
      saveFavouritestToStorage();
      favourites.refresh();
      BLoaders.customToast(message: 'Removed from favourites');
    }
  }

  void saveFavouritestToStorage() {
    final encodedFavourites=json.encode(favourites);
    BLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavourieProducts(favourites.keys.toList());
  }
}