import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/data/repositories/authentication.dart';
import 'package:flutter_application_1/features/personalization/models/address_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Error';
      final snapshot = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return snapshot.docs
          .map((e) => AddressModel.fromDocumentSnapshot(e))
          .toList();
    } catch (e) {
      throw 'Error in Address';
    }
  }

  Future<void> updateSelectedAddress(String addressId, bool seleted) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': seleted});
    } catch (e) {
      throw 'Error in Address';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final docRef = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return docRef.id;
    } catch (e) {
      throw 'Error in Address';
    }
  }
}
