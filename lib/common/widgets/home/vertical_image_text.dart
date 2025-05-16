import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/store/b_circular_image.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, required this.image, required this.title, this.textColor=BColors.white, this.backgroundColor=BColors.white, this.onTop, this.isNetworkImage=true,
  });
  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTop;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Padding(
        padding: const EdgeInsets.only(right: BSizes.spaceBtwItems),
        child: Column(
          children: [
            BCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: BSizes.sm*1.4,
              isNetworkImage: true,
              backgroundColor: backgroundColor,
              // overlayColor: dark ? BColors.light : BColors.dark,
            ),
            const SizedBox(height: BSizes.spaceBtwItems/2),
            SizedBox(
              width: 55,
              child: Text(title,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              )
            )
          ],
        ),
      ),
    );
  }
}


