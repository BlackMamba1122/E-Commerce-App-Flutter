import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/shop/models/category_model.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../../utils/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  
  final _db=FirebaseFirestore.instance;
  
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot=await _db.collection('Categories').get();
      final list=snapshot.docs.map((document)=>CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something Went Wrong. Try Again.';
    }
  }

  Future<List<CategoryModel>> getSubCategories(categoryId) async {
    try{
      final snapshot=await _db.collection('Categories').where('ParentId',isEqualTo: categoryId).get();
      final list=snapshot.docs.map((document)=>CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something Went Wrong. Try Again.';
    }
  }

  Future<void> uploadDummyData (List<CategoryModel> categories) async {
    try {
// Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
    for (var category in categories) {
// Get ImageData link from the local assets
    final file = await storage.getImageDataFromAssets (category.image);
// Upload Image and Get its URL
    final url = await storage.uploadImageData('Categories', file, category.name);
// Assign URL to Category. image attribute
    category. image = url;
// Store Category in Firestore
    await _db.collection ("Categories").doc (category.id).set(category. toJson());
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