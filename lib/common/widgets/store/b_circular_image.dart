import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/BShimmerEffect.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class BCircularImage extends StatelessWidget {
  const BCircularImage({
    super.key, this.fit=BoxFit.contain, required this.image, this.overlayColor, this.backgroundColor, this.width=56,  this.height=56, this.padding = BSizes.sm, this.isNetworkImage=false,
  });
  final BoxFit? fit;
  final String image;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width,height,padding;
  final bool isNetworkImage;
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
          ? CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context,url,downloadProgress)=>BShimmerEffect(width: 55, height: 55,radius: 55,),
            errorWidget: (context,url,error)=>Icon(Icons.access_alarm_sharp),
          )
         : Image(
          fit: fit,
          image: AssetImage(image),
          color: overlayColor,
          ),
        ),
      ),
    );
  }
}