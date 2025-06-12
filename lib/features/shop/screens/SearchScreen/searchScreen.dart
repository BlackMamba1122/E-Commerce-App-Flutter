import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/product_cart_vertical.dart';
import 'package:flutter_application_1/features/shop/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/home/grid_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchProductController());

    return Scaffold(
      appBar: const BAppBar(
        title: Text("Search Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            TextField(
              onChanged: controller.search,
              decoration: const InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () {
                final results = controller.filteredProducts;
                if (results.isEmpty && controller.query.isNotEmpty) {
                  return const Center(child: Text("No products found."));
                }
                return BGridViewLayout(
                    itemCount: results.length,
                    itemBuilder: (_, index) =>
                        BProductCardVertical(product: results[index]));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
