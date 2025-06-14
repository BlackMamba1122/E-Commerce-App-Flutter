import 'package:flutter_application_1/features/personalization/controllers/address_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/checkout_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/variation_controller.dart';
import 'package:flutter_application_1/utils/network.dart';
import 'package:get/get.dart';


class GenralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}