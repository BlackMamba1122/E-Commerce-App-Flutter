import 'package:flutter_application_1/features/authentication/screens/onboard/onboarding.dart';
import 'package:flutter_application_1/features/authentication/screens/password_config/reset_password.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_application_1/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_application_1/features/shop/screens/order/OrderScreen.dart';
import 'package:flutter_application_1/features/shop/screens/productreview/product_review.dart';
import 'package:flutter_application_1/features/shop/screens/store/store.dart';
import 'package:flutter_application_1/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/personalization/screens/address/UserAddressScreen.dart';
import '../features/personalization/screens/profile/Profile.dart';
import '../features/personalization/screens/settings/Settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/home/home.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: BRoutes.home, page: () => const HomeScreen()),
    GetPage(name: BRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: BRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: BRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: BRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: BRoutes.verifyEmail, page: () => const VerifyEmail()),
    GetPage(name: BRoutes.store, page: () => const Store()),
    GetPage(name: BRoutes.favourites, page: () => const Wishlist()),
    GetPage(name: BRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: BRoutes.productReviews, page: () => const ProductReview()),
    GetPage(name: BRoutes.order, page: () => const Orderscreen()),
    GetPage(name: BRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: BRoutes.cart, page: () => const CartScreen()),
    GetPage(name: BRoutes.forgetPassword, page: () => const ResetPassword()),
    GetPage(name: BRoutes.onBoarding, page: () => const OnboardScreen()),
  ];
}
// Add more GetPage entries as needed
