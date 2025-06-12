import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/shop/models/product_category_model.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_application_1/utils/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class ProductRepository extends GetxController {

  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where(
          'IsFeatured', isEqualTo: true).get();
        final allProducts=snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
        allProducts.shuffle();
      return allProducts.take(5).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }


  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where(
          'IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList =querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;

    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getFavourieProducts(List<String> ids) async {
    try {
      if(ids.isEmpty) return [];
      final querySnapshot = await _db.collection('Products').where(FieldPath.documentId,whereIn: ids).get();
      final products=querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getProductForBrand({required String brandId,int limit=-1}) async {
    try {
      final querySnapshot =limit==-1 ? await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).get()
          : await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).limit(limit).get();
      final products=querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getProductForCategory({required String categoryId,int limit=-1}) async {
    try {
      final querySnapshot =limit==-1 ? await _db.collection('ProductCategory').where('categoryId',isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId',isEqualTo: categoryId).limit(limit).get();

      List<String> productIds=querySnapshot.docs.map((doc) => doc.get('productId')as String).toList();
      final productQuery=await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();
      final products=productQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getProductForAi({required List<String> ids}) async {
    try {
      final querySnapshot = await _db.collection('Products').where('Id',whereIn: ids).get();
      final products=querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch(e) {
      throw 'Something went wrong';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
        final Map<String, String> uploadedBrands = {};
// Upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each product
      for (var product in products) {
        final Map<String, String> uploadedImagesCache = {};
// Get image data Link from Local assets
        if(!uploadedImagesCache.containsKey(product.thumbnail)) {
          final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
          final fileName = path.basename(product.thumbnail.toString());
  // Upload image and get its URL
          final url = await storage.uploadImageData('Products/Images', thumbnail, fileName);
          uploadedImagesCache[product.thumbnail] = url;
          product.thumbnail = url;
        }
        else {
          product.thumbnail = uploadedImagesCache[product.thumbnail]!;
        }
// Assign URL to product. thumbnail attribute
// Product list of images
        //brand
        if (product.brand!.image .isNotEmpty) {
          if (uploadedBrands.containsKey(product.brand!.image)) {
            product.brand!.image = uploadedBrands[product.brand!.image]!;
          }
          else {
            final assetImage = await storage.getImageDataFromAssets(
                product.brand!.image);
            final fileNamee = path.basename(product.brand!.image.toString());
// Upload image and get its URL
            final urlBanner = await storage.uploadImageData(
                'Products/Images', assetImage, fileNamee);
            uploadedBrands[product.brand!.image] = urlBanner;
            product.brand!.image = urlBanner;
          }
        }
        if (product.images != null && product.images !.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
// Get image data Link from Local assets
            if (uploadedImagesCache.containsKey(image)) {
              imagesUrl.add(uploadedImagesCache[image]!);
            }
            else {
              final assetImage = await storage.getImageDataFromAssets(image);
              final fileNamee = path.basename(image.toString());
// Upload image and get its URL
              final url = await storage.uploadImageData(
                  'Products/Images', assetImage, fileNamee);
// Assign URL to product.thumbnail attribute
              imagesUrl.add(url);
              uploadedImagesCache[image] = url;
            }
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
// Get image data link from Local assets
            if (uploadedImagesCache.containsKey(variation.image)) {
              variation.image = uploadedImagesCache[variation.image]!;
            }
            else {
              final assetImage = await storage.getImageDataFromAssets(
                  variation.image);
              final fileNameee = path.basename(variation.image.toString());
// Upload image and get its URL
              final url = await storage.uploadImageData(
                  'Products/Images', assetImage, fileNameee);
// Assign URL to variation.image attribute
              uploadedImagesCache[variation.image] = url;
              variation.image = url;
            }
          }
        }
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message !;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadDummyData2 (List<ProductCategoryModel> brands) async {
    int i=0;
    try {
      for (var brand in brands) {
        i++;
        await _db.collection ("ProductCategory").doc(i.toString()).set(brand.toJson());
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