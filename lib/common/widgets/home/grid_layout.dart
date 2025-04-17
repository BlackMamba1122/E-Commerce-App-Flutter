import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class BGridViewLayout extends StatelessWidget {
  const BGridViewLayout({
    super.key, required this.itemCount, this.mainAxisExtent=288, required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext,int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisExtent: mainAxisExtent,
      mainAxisSpacing: BSizes.gridViewSpacing,
      crossAxisSpacing: BSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
      );
  }
}