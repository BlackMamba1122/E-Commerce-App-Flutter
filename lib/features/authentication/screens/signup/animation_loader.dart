import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class BAnimationLoaderWidget extends StatelessWidget {
  const BAnimationLoaderWidget({super.key, required this.text, required this.animation, this.showAction=false, this.actionText, this.onActionPressed});
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

@override
Widget build (BuildContext context) {
return Center(
child: Column (
mainAxisAlignment: MainAxisAlignment.center,
children: [
Lottie.asset (animation, width: MediaQuery. of (context).size.width * 8.8), // Display Lottie animation
const SizedBox (height: BSizes.defaultSpace),
Text(
text,
style: Theme. of (context).textTheme.bodyMedium,
textAlign: TextAlign.center,
), // Text
const SizedBox (height: BSizes.defaultSpace),
showAction
? SizedBox(
width: 250,
child: OutlinedButton(
onPressed: onActionPressed,
style: OutlinedButton.styleFrom(backgroundColor: BColors.dark),
child: Text(
actionText!,
style: Theme. of (context).textTheme.bodyMedium!.apply(color: BColors.light),
), // Text
), // OutlinedButton
) // SizedBox
:const SizedBox(),
],
), // Column
); // Center
}

  
}