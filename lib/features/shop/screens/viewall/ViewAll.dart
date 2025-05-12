import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/features/shop/controllers/all_product_controller.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/VerticalProductShimmer.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ViewallScreen extends StatelessWidget {
  const ViewallScreen({super.key, required this.title, this.query, this.futureMethod});
    final String title;
    final Query? query;
    final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: BAppBar(title: Text(title), showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductByQuery(query),
            builder: (context,snapshot) {
              const loader= BVerticalProductShimmer();
              final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
              if(widget!=null) return widget;
              final products=snapshot.data!;
              return SortableProduct(products: products,);
            }
          ),
        ),
      ),
    );
  }
}

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key, required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
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
        Obx(()=> BGridViewLayout(itemCount: controller.products.length, itemBuilder: (_,index)=>BProductCardVertical(product: controller.products[index],)))
      ],
    );
  }
}
