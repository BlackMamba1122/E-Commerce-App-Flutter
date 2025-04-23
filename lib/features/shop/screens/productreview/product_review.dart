import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/circle_conatiner.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/device/device_utlity.dart';
import 'package:flutter_application_1/utils/helpers/helper_function.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(title: Text('Review & Rating'),showArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('asd'),
              const SizedBox(height: BSizes.spaceBtwItems,),
              const OverallRatingProgress(),
              const BRatingBarIndicator(value: 4.3,),
            Text('12,122',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: BSizes.spaceBtwSections,),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class BRatingBarIndicator extends StatelessWidget {
  const BRatingBarIndicator({
    super.key, required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: value,
      itemSize: 20,
      unratedColor: BColors.grey,
      itemBuilder: (_,__)=>const Icon(Iconsax.star1,color: BColors.primary,),
    );
  }
}

class OverallRatingProgress extends StatelessWidget {
  const OverallRatingProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.9',style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ProgressRating(text: '5',value: 0.1),
              ProgressRating(text: '4',value: 0.3),
              ProgressRating(text: '3',value: 0.5),
              ProgressRating(text: '2',value: 0.8),
              ProgressRating(text: '1',value: 0.45),
            ],
          ),
        )
      ],
    );
  }
}

class ProgressRating extends StatelessWidget {
  const ProgressRating({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: BDeviceUtils.getScreenWidth(context)*0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: BColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(BColors.primary),
            ),
          ),
        )
      ],
    );
  }
}

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(BImages.userProfileImage1),),
                const SizedBox(width: BSizes.spaceBtwItems,),
                Text('Adil Khan',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems,),
        Row(
          children: [
            const BRatingBarIndicator(value: 3),
            const SizedBox(width: BSizes.spaceBtwItems,),
            Text('01 Nov 2021',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems,),
        const ReadMoreText(
          'ashdha adhsjd ajsdas akdaksd kaksdkad woqejda adjadla qsdajda ad',
          trimLines: 1,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
        ),
        const SizedBox(height: BSizes.spaceBtwItems,),
        CircleConatiner(
          backgroundColor: dark? BColors.darkerGrey:BColors.grey,
          padding: const EdgeInsets.all(BSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Adil Khan',style: Theme.of(context).textTheme.titleMedium,),
                  Text('01 Nov 2021',style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: BSizes.spaceBtwItems,),
              const ReadMoreText(
                'ashdha adhsjd ajsdas akdaksd kaksdkad woqejda adjadla qsdajda ad',
                trimLines: 1,
                trimExpandedText: ' show less',
                trimCollapsedText: ' show more',
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: BColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: BSizes.spaceBtwSections,),
      ],
    );
  }
}
