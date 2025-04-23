import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/home/section_heading.dart';
import 'package:flutter_application_1/common/widgets/store/b_circular_image.dart';
import 'package:flutter_application_1/utils/constants/imge_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text('Profile'),
        showArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const BCircularImage(image: BImages.user,width: 80,height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: BSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems,),
            const BSectionHeading(title: "Profile Information", showActionButton: false),
                const SizedBox(height: BSizes.spaceBtwItems),
            profileMenu(title: 'Name', value: 'M.Ahmad', onTap: (){}),
                profileMenu(title: "Username", value: 'Ahmad', onTap: () {}),
                const SizedBox(height: BSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: BSizes.spaceBtwItems),
        const BSectionHeading(title: "Personal Information", showActionButton: false),
        const SizedBox(height: BSizes.spaceBtwItems),
              profileMenu(title: "User ID", value: '123456', onTap: () {}),
              profileMenu(title: "E-mail", value: 'ahmad@gmail.com', onTap: (){}),
              profileMenu(title: "Phone Number", value: '+92-123-1234567', onTap: (){}),
              profileMenu(title: "Gender", value: 'Male', onTap: (){}),
              profileMenu(title: "Date of Birth", value: '30 Feb, 1947', onTap: () {}),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems,),
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Delete',style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class profileMenu extends StatelessWidget {
  const profileMenu({
    super.key, this.icon=Iconsax.arrow_right_14, required this.onTap, required this.title, required this.value,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(BSizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(flex: 3,child:Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5,child: Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
            Expanded(child: Icon(icon,size: 18,)),
          ],
        ),
      ),
    );
  }
}
