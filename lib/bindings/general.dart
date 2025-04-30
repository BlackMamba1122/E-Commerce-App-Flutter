import 'package:flutter_application_1/utils/network.dart';
import 'package:get/get.dart';

class GenralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}