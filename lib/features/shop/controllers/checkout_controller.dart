import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/home/circle_conatiner.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import '../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: BImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPayment(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(BSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BSectionHeading(
                        title: 'Select Payment Method',
                        showActionButton: false),
                    const SizedBox(
                      height: BSizes.spaceBtwSections,
                    ),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal',image: BImages.paypal)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay',image: BImages.googlePay)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Visa',image: BImages.visa)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card',image: BImages.masterCard)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm',image: BImages.paytm)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Pay Stack',image: BImages.paystack)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    BPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card',image: BImages.creditCard)),
                    const SizedBox(height: BSizes.spaceBtwItems/2,),
                    const SizedBox(height: BSizes.spaceBtwSections,)
                  ],
                ),
              ),
            ));
  }
}

class BPaymentTile extends StatelessWidget {
  const BPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: CircleConatiner(
        width: 60,
        height: 40,
        backgroundColor: BHelperFunctions.isDarkMode(context)
            ? BColors.light
            : BColors.white,
        padding: const EdgeInsets.all(BSizes.sm),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
