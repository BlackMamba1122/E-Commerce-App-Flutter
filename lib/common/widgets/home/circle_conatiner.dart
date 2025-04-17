import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class CircleConatiner extends StatelessWidget {
  const CircleConatiner({super.key, this.width, this.height, this.radius=BSizes.cardRadiusLg, this.padding, this.child, this.backgroundColor=BColors.white, this.margin, this.showBorder =false, this.borderColor=BColors.borderPrimary});
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
                    width: width,
                    height: height,
                    margin: margin,
                    padding: padding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: backgroundColor,
                      border: showBorder ? Border.all(color: borderColor) : null,
                    ),
                    child: child,
                  );
  }
}