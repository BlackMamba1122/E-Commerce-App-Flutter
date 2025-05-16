import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/features/shop/controllers/cart_controller.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/utils/popups/full_screen_loader.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../common/widgets/login/success_screen.dart';
import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/order_repository.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/imge_string.dart';
import '../../personalization/controllers/address_controller.dart';
import '../models/order_model.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = await orderRepository.fetchUserOrders();
      return orders;
    } catch (e) {
      BLoaders.warningSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  void processorder(double totalAmount) async {
    try {
// Start Loader
      BFullScreenLoader.openLoadingDialog(
          'Processing your order', BImages.pencilAnimation);
// Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;
// Add Details
      final order = OrderModel(
// Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );
      await orderRepository.saveOrder(order, userId);
      cartController.clearCart();
      Get.off(() =>
       SuccessScreen(
        image: BImages.orderCompleteAnimation,
        title: 'Payment Successful',
        subtitle: 'Your order has been placed successfully',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    } catch (e) {
      BLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
