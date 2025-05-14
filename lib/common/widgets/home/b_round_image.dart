import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

import '../../../utils/BShimmerEffect.dart';


class BRoundImage extends StatelessWidget {
  const BRoundImage({
    super.key, this.width, this.height, required this.imageUrl, this.applyImageRadius = true, this.border, this.background, this.fit = BoxFit
        .contain, this.padding, this.onPressed, this.isNetworkImage = false, this.borderRadius = BSizes
        .md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? background;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            border: border,
            color: background,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              placeholder: (context, url) =>
                  BShimmerEffect(width: width ?? 180, height: height ?? 180, radius: borderRadius),
              errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image),
            )
                : Image.asset(
              imageUrl,
              fit: fit,
            ),
          ),
        )
    );
  }
}
