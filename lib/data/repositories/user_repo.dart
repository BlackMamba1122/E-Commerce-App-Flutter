import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/features/personalization/models/UserModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async
  {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  Future<UserModel> fetchUserRecord() async
  {
    try {
      final detail=await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(detail.exists)
        return UserModel.fromSnapshot(detail);
      else
        return UserModel.empty();
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


  Future<void> updateUserRecord(UserModel user) async
  {
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
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


  Future<void> updateUserSingleRecord(Map<String,dynamic>json) async
  {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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


  Future<void> removeUserRecord(String userId) async
  {
    try {
      await _db.collection("Users").doc(userId).delete();
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

  Future<String> uploadImage(String path,XFile image) async
  {
    try {
      final ref=FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url=await ref.getDownloadURL();
      return url;
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
}