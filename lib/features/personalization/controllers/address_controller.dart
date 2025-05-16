import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/address_repository.dart';
import 'package:flutter_application_1/features/personalization/models/address_model.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/popups/full_screen_loader.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../common/widgets/home/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/cloud_helper_functions.dart';
import '../../../utils/network.dart';
import '../screens/address/UserAddressScreen.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel
      .empty()
      .obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress,
              orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      BLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedAddress(
            selectedAddress.value.id, false);
      }
      newAddress.selectedAddress = true;
      selectedAddress.value = newAddress;
      await addressRepository.updateSelectedAddress(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      BLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  Future addNewAddress() async {
    try {
      BFullScreenLoader.openLoadingDialog('Storing Address', BImages.docker);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BLoaders.errorSnackBar(
            title: 'Error', message: 'No Internet Connection');
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }
      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);
      address.id = id;
      await selectAddress(address);
      BFullScreenLoader.stopLoading();
      BLoaders.successSnackBar(title: 'Congratulations',
          message: 'Your address has been saved successfully. ');
      refreshData.toggle();
      resetFormFields();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      BLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) =>
          Container(
            padding: const EdgeInsets.all(BSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BSectionHeading(
                    title: 'Select Address', showActionButton: false),
                FutureBuilder(
                    future: allUserAddresses(),
                    builder: (_, snapshot) {
                      final response = TCloudHelperFunctions
                          .checkMultiRecordState(
                          snapshot: snapshot);
                      if (response != null) return response;
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) =>
                              SingleAddress(
                                  address: snapshot.data! [index],
                                  onTap: () async {
                                    await selectAddress(snapshot.data! [index]);
                                    Get.back();
                                  }
                              ), // TSingleAddress
                        ),
                      );
                    } // ListView.builder
                ), // FutureBuilder
                const SizedBox(height: BSizes.defaultSpace * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const AddNewAddress()),
                      child: const Text('Add new address')),
                ),
              ], // SizedBox
            ), // Column
          ),
    ); // Container
  }
}