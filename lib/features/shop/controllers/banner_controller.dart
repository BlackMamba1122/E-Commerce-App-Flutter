import 'package:flutter_application_1/data/repositories/banner_repository.dart';
import 'package:flutter_application_1/features/shop/models/banner_model.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final isLoading =false.obs;

  final RxList<BannerModel> banners=<BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void updatePageindicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanner() async{
    try{
      isLoading.value=true;
      final bannerRepo=Get.put(BannerRepository());
      final banner = await bannerRepo.fetchBanner();
      banners.assignAll(banner);
    }catch(e){
      BLoaders.warningSnackBar(title: 'Oh Snap',message: e.toString());
    }finally{
      isLoading.value=false;
    }
  }
}