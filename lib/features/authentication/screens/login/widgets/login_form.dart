import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/password_config/reset_password.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/signup.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_string.dart';
import 'package:flutter_application_1/utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(loginController());
    return Form(
      key: controller.LoginFormkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value)=>BValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: BTexts.email,
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwInputFields),
            //Pass
            Obx(
                  ()=> TextFormField(
                controller: controller.pass,
                validator: (value) => BValidator.validateEmptyText('Password',value),
                obscureText: controller.hidepass.value,
                decoration: InputDecoration(
                  labelText: BTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed:() =>controller.hidepass.value =!controller.hidepass.value,
                      icon: controller.hidepass.value ? Icon(Iconsax.eye_slash):Icon(Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //rememberme
                    Obx(
                    ()=> Checkbox(
                        value: controller.rememberme.value, // Set value based on _rememberMe variable
                        onChanged: (value) =>controller.rememberme.value=!controller.rememberme.value,
                      ),
                    ),
                    const Text(BTexts.rememberMe),
                  ],
                ),
                //forgetpass
                TextButton(
                  onPressed: ()=>Get.to(()=> const ResetPassword()),
                  child: const Text(BTexts.forgetPassword,style: TextStyle(color:BColors.primary),),
                ),
              ],
            ),
            const SizedBox(height: BSizes.spaceBtwSections),
            //signin
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.SignIn(),
                child: const Text(BTexts.signIn),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwItems),
            //crate
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(BTexts.createAccount),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
