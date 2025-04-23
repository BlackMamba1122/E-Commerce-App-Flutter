import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key, this.iconcolor=BColors.black, required this.onPressed,
  });
  final Color iconcolor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag,color:iconcolor,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: BColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color: BColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        )
    
      ],
    );
  }
}