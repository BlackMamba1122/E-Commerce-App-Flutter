import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';


class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: BColors.grey),borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: BSizes.iconMd,
                        height: BSizes.iconMd,
                        image: AssetImage(BImages.google),

                      ),
                    ),
                  ),
                  const SizedBox(width: BSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: BColors.grey),borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: BSizes.iconMd,
                        height: BSizes.iconMd,
                        image: AssetImage(BImages.facebook),

                      ),
                    ),
                  ),
                ],
              );
  }
}