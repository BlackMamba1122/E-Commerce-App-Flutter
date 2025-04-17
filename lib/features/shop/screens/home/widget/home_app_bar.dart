import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/appbar/cart_menu_icon.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(BTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: BColors.grey)),
        Text(BTexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: BColors.white)),
      ],
    ),
    actions: [
      CartCounterIcon(onPressed: (){})
    ],
    );
  }
}