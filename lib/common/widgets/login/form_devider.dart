import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';

class FormDivider extends StatelessWidget {

  const FormDivider({super.key,required this.dividertext});
  final String dividertext;
  @override
  Widget build(BuildContext context) {
  final dark = BHelperFunctions.isDarkMode(context);
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? BColors.darkGrey : BColors.grey, thickness: 0.5, indent: 60,endIndent: 5)),
                  Text(dividertext, style: Theme.of(context).textTheme.labelMedium),              
                  Flexible(child: Divider(color: dark ? BColors.darkGrey : BColors.grey, thickness: 0.5, indent: 5,endIndent: 60)),                
                ],
              );
  }
}