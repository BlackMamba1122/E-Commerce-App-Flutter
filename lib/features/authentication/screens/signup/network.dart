// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController {
// static NetworkManager get instance => Get.find();

// final Connectivity _connectivity = Connectivity();
// late StreamSubscription<ConnectivityResult> _connectivitysubscription;
// final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

// @override
// void onInit() {
//   super.onInit();
// _connectivitysubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
// }

// Future<void> _updateConnectionStatus (ConnectivityResult result) async {
// _connectionStatus.value = result;
// if (_connectionStatus.value== ConnectivityResult.none)
// loaders.worningSnackBar (title: 'No Internet Connection');
// }
// }

// /// Check the internet connection status.

// /// Returns true if connected, 'false' otherwise.

// Future<bool> isConnected() async {


// try {
// final result = await connec

// if (result ConnectivityResult.none) {

// return false;

// } else {