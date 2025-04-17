import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';


class BCircluarIcon extends StatelessWidget {
  const BCircluarIcon({
    super.key,
    this.height, this.width, this.size, required this.icon, this.color, this.onPressed, this.backgroundColor,
  });

  final double? height,width,size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor != null 
            ? (backgroundColor) 
            : (BHelperFunctions.isDarkMode(context) 
              ? BColors.dark.withOpacity(0.7) 
              : BColors.light.withOpacity(0.7)),
          borderRadius:BorderRadius.circular(100),
        ),
        child: IconButton(onPressed: onPressed, icon: Icon(icon,color:color,size:size)),
      ),
    );
  }
}