import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class AiRepository extends GetxController {
  static AiRepository get instance => Get.find();

  Future<List<Map<String, dynamic>>> fetchAndCacheProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection("Products")
          .get();
      final cachedProducts = snapshot.docs.map((doc) => doc.data()).toList();
      return cachedProducts;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}