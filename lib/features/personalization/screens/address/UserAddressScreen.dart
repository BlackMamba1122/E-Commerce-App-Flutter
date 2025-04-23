import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.to(()=>const AddNewAddress()),
        backgroundColor: BColors.primary,
        child: const Icon(Iconsax.add,color: BColors.white,),
      ),
      appBar: BAppBar(title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),showArrow: true,),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(address: true,),
              SingleAddress(address: false,),
              SingleAddress(address: false,),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key, required this.address,
  });
  final bool address;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return CircleConatiner(
      padding: const EdgeInsets.all(BSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: address ? BColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: address ? Colors.transparent : dark ? BColors.darkerGrey : BColors.grey,
      margin: const EdgeInsets.only(bottom: BSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              address ? Iconsax.tick_circle5 : null,
              color: address ? dark ? BColors.light : BColors.dark :null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmad',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: BSizes.sm/2,),
              const Text('+92 123 123456',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: BSizes.sm/2,),
              const Text('LAhore Dubai Islamabd Multan haldk aldkna jajs',softWrap: true,)
            ],
          )
        ],
      ),
    );
  }
}

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text('Add new Address'),
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
                const SizedBox(height: BSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
                const SizedBox(height: BSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                    const SizedBox(height: BSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),)),
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),)),
                    const SizedBox(height: BSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),
                const SizedBox(height: BSizes.spaceBtwInputFields*2,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){},child: const Text('Save'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
