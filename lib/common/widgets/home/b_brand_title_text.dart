import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';

class BBrandTitleText extends StatelessWidget {
  const BBrandTitleText({
    super.key, required this.title,this.maxLines=1, this.textAlign=TextAlign.center, this.brandTextSize=TextSizes.small, this.color,
  });
  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: brandTextSize == TextSizes.small 
      ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
        : brandTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
        : brandTextSize == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
