import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/utils/exceptions/format_exceptions.dart';
import 'package:flutter_application_1/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_application_1/utils/firebase_storage_service.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final result = await _db.collection('Brands').get();
      return result.docs.map((documentSnapshot) =>
          BrandModel.fromSnapShot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong. Try Again.';
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapShot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong. Try Again.';
    }
  }

  Future<void> uploadDummyData (List<BrandModel> brands) async {
    int i=0;
    try {
// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
      for (var brand in brands) {
        i++;
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets (brand.image);
// Upload Image and Get its URL
        final url = await storage.uploadImageData('Brands', file,'brand_$i');
// Assign URL to Category. image attribute
        brand.image = url;
// Store Category in Firestore
        await _db.collection ("Brands").doc().set(brand.toJson());
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