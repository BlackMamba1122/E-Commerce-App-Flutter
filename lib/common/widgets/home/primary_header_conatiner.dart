import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/curved_edge_widget.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';

class PrimaryHeaderConatiner extends StatelessWidget {
  const PrimaryHeaderConatiner({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
      color: BColors.primary,
      child: Stack(
      children: [
      Positioned(top:-150, right: -250, child: CircleConatiner(backgroundColor: BColors.textWhite.withOpacity(0.1),radius:400,height:400,width:400)),
      Positioned(top: 100, right: -300, child: CircleConatiner(backgroundColor: BColors.textWhite.withOpacity(0.1),radius:400,height:400,width:400)),
      child,
          ],
              ),
          ),
    );
  }
}

