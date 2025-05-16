import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/features/personalization/controllers/address_controller.dart';
import 'package:flutter_application_1/features/shop/controllers/cart_controller.dart';
import 'package:flutter_application_1/features/shop/screens/cart/cart.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_calculator.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controllers/checkout_controller.dart';
import '../../controllers/order_controller.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    final subTotal=controller.totalCartPrice.value;
    final orderController=Get.put(OrderController());
    final totalAmount =BPricingCalculator.calculateTotalPrice(subTotal, 'Pakistan');
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: BAppBar(title: Text('CheckOut',style: Theme.of(context).textTheme.headlineSmall,),showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const CartItemBuilder(ShowAddRemove: false,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              const CoupenCode(),
              const SizedBox(height: BSizes.spaceBtwSections,),
              CircleConatiner(
                showBorder: true,
                padding: const EdgeInsets.all(BSizes.md),
                backgroundColor: dark?BColors.black:BColors.white,
                child: const Column(
                  children: [
                    BillTotal(),
                    SizedBox(height: BSizes.spaceBtwItems,),
                    Divider(),
                    SizedBox(height: BSizes.spaceBtwItems,),
                    BillingPayment(),
                    SizedBox(height: BSizes.spaceBtwItems,),
                    BillingAddress()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal>0 && AddressController.instance.selectedAddress.value.id.isNotEmpty
          ? ()=>orderController.processorder(totalAmount)
          : subTotal>0 ? ()=>BLoaders.warningSnackBar(title: 'Empty Cart',message: 'Add Items') :()=>BLoaders.warningSnackBar(title: 'Empty Address',message: 'Add Address'),
          child: Text('CheckOut  Rs.${NumberFormat('#,##0', 'en_US').format(totalAmount)}',),
        ),
      ),
    );
  }
}

class CoupenCode extends StatelessWidget {
  const CoupenCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return CircleConatiner(
      showBorder: true,
      backgroundColor: dark ? BColors.dark : BColors.white,
      padding: const EdgeInsets.only(top: BSizes.sm,bottom: BSizes.sm,right: BSizes.sm,left: BSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Promo Code.',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 80,child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? BColors.white.withOpacity(0.5) : BColors.dark.withOpacity(0.5),
                backgroundColor: BColors.grey.withOpacity(0.2),
                side: BorderSide(color: BColors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply')
          )),
        ],
      ),
    );
  }
}

class BillTotal extends StatelessWidget {
  const BillTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    final subTotal=controller.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal',style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs.${NumberFormat('#,##0', 'en_US').format(subTotal)}',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ShippingFee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs.${BPricingCalculator.calculateShippingCost(subTotal, 'Pakistan')}',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax',style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs.${BPricingCalculator.calculateTax(subTotal, 'Pakistan')}',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs.${NumberFormat('#,##0', 'en_US').format(BPricingCalculator.calculateTotalPrice(subTotal, 'Pakistan'))}',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}


class BillingPayment extends StatelessWidget {
  const BillingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CheckoutController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        BSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: ()=>controller.selectPayment(context),
        ),
        const SizedBox(height: BSizes.spaceBtwItems/2,),
        Obx(()
          => Row(
            children: [
              CircleConatiner(
                width: 60,
                height: 35,
                backgroundColor: dark ? BColors.light : BColors.white,
                padding: const EdgeInsets.all(BSizes.sm),
                child: Image(image: AssetImage(controller.selectPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(width: BSizes.spaceBtwItems/2,),
              Text(controller.selectPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,),

            ],
          ),
        )
      ],
    );
  }
}

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
    controller.allUserAddresses();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: ()=>controller.selectNewAddressPopup(context),
        ),
        const SizedBox(height: BSizes.spaceBtwItems/2,),
        controller.selectedAddress.value.id.isNotEmpty
        ?Obx(()
          => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.selectedAddress.value.name,style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: BSizes.spaceBtwItems/2,),
              Row(
                children: [
                  const Icon(Icons.phone,color: BColors.grey,size: 16,),
                  const SizedBox(width: BSizes.spaceBtwItems,),
                  Text(controller.selectedAddress.value.phoneNumber,style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: BSizes.spaceBtwItems/2,),
              Row(
                children: [
                  const Icon(Icons.location_history,color: BColors.grey,size: 16,),
                  const SizedBox(width: BSizes.spaceBtwItems,),
                  Text(controller.selectedAddress.value.toString(),style: Theme.of(context).textTheme.bodyMedium,softWrap: true,),
                ],
              ),
            ],
          ),
        ) : Text('Select Address',style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
