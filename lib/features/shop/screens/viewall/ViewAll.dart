import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ViewallScreen extends StatelessWidget {
  const ViewallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BAppBar(title: Text('Popular Product'), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace),
          child: SortableProduct(),
        ),
      ),
    );
  }
}

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'None',
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        ),
        const SizedBox(height: BSizes.spaceBtwSections,),
        BGridViewLayout(itemCount: 5, itemBuilder: (_,index)=>const BProductCardVertical())
      ],
    );
  }
}
