import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../../utils/firebase_storage_service.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanner() async
  {
    try {
      final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapShot)=>BannerModel.fromSnapshot(documentSnapShot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something Went Wrong. Try Again.';
    }
  }

  Future<void> uploadDummyData (List<BannerModel> banners) async {
    int i=0;
    try {
// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
      for (var banner in banners) {
        i++;
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets (banner.imageUrl);
// Upload Image and Get its URL
        final url = await storage.uploadImageData('Banners', file,'banner_$i');
// Assign URL to Category. image attribute
        banner.imageUrl = url;
// Store Category in Firestore
        await _db.collection ("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}