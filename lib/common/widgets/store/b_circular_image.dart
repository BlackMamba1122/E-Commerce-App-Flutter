import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class BCircularImage extends StatelessWidget {
  const BCircularImage({
    super.key, this.fit=BoxFit.cover, required this.image, this.overlayColor, this.backgroundColor, this.width=56,  this.height=56, this.padding = BSizes.sm,
  });
  final BoxFit? fit;
  final String image;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width,height,padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (BHelperFunctions.isDarkMode(context) ? BColors.black : BColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
        fit: fit,
        image: AssetImage(image),
        color: overlayColor,

            
        ),
      ),
    );
  }
}