import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, required this.image, required this.title, this.textColor=BColors.white, this.backgroundColor=BColors.white, this.onTop,
  });
  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTop;
  @override
  Widget build(BuildContext context) {
    final dark =BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTop,
      child: Padding(
        padding: const EdgeInsets.only(right: BSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(BSizes.sm), //
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? BColors.black : BColors.white),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image),fit: BoxFit.cover,),
              ),
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


