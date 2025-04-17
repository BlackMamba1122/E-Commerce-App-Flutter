import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});
  @override
  Widget build(BuildContext context) {
  final dark = BHelperFunctions.isDarkMode(context);
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                
                    image: AssetImage(dark ? BImages.darkAppLogo : BImages.lightAppLogo),
                  ),
                  Text(BTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: BSizes.sm),
                  Text(BTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium)
                ],
              );
  }
}