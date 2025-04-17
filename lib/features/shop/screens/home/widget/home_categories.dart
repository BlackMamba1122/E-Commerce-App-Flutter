import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/vertical_image_text.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'image': BImages.sportIcon, 'title': 'Sports'},
      {'image': BImages.clothIcon, 'title': 'Clothing'},
      {'image': BImages.shoeIcon, 'title': 'Shoes'},
      {'image': BImages.cosmeticsIcon, 'title': 'Cosmetics'},
      {'image': BImages.animalIcon, 'title': 'Animals'},
      {'image': BImages.toyIcon, 'title': 'Toys'},
      {'image': BImages.furnitureIcon, 'title': 'Furniture'},
      {'image': BImages.jeweleryIcon, 'title': 'Jewelry'},
      {'image': BImages.electronicsIcon, 'title': 'Electronics'},
    ];
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
          final category = categories[index];
          return VerticalImageText(
            image: category['image']!,
            title: category['title']!,
            onTop: () {},
          );
        },
      ),
    );
  }
}
