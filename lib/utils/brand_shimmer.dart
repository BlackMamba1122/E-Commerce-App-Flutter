import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/grid_layout.dart';
import 'package:flutter_application_1/utils/BShimmerEffect.dart';

class BBrandShimmer extends StatelessWidget {
  const BBrandShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return BGridViewLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder:(_,__)=> const BShimmerEffect(width: 300, height: 80)
    );
  }
}
