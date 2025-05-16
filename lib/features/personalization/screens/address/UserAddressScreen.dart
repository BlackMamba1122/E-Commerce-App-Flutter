import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/features/personalization/controllers/address_controller.dart';
import 'package:flutter_application_1/features/personalization/models/address_model.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddress()),
        backgroundColor: BColors.primary,
        child: const Icon(
          Iconsax.add,
          color: BColors.white,
        ),
      ),
      appBar: BAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Obx(()
            => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
                future: controller.allUserAddresses(),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;
                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => SingleAddress(
                          address: addresses[index],
                          onTap: () =>
                              controller.selectAddress(addresses[index])));
                }),
          ),
        ),
      ),
    );
  }
}

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = BHelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: CircleConatiner(
          padding: const EdgeInsets.all(BSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor:
              selectedAddress ? BColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? BColors.darkerGrey
                  : BColors.grey,
          margin: const EdgeInsets.only(bottom: BSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? BColors.light
                          : BColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: BSizes.sm / 2,
                  ),
                   Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: BSizes.sm / 2,
                  ),
                   Text(
                    address.toString(),
                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const BAppBar(
        title: Text('Add new Address'),
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value)=>BValidator.validateEmptyText('Name', value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: BSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value)=>BValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: BSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.street,
                          validator: (value)=>BValidator.validateEmptyText('Street', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street'),
                    )),
                    const SizedBox(
                      height: BSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: controller.postalCode,
                          validator: (value)=>BValidator.validateEmptyText('Postal Code', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: BSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.city,
                          validator: (value)=>BValidator.validateEmptyText('City', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City'),
                    )),
                    const SizedBox(
                      height: BSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: controller.state,
                          validator: (value)=>BValidator.validateEmptyText('State', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: BSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value)=>BValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: BSizes.spaceBtwInputFields * 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
