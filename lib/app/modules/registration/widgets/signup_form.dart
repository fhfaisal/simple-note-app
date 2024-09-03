import 'package:caretutors/app/modules/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../utils/validators/validators.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return SingleChildScrollView(
      child: Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            ///Username
            TextFormField(
              controller: controller.username.value,
              validator: (value) => AppValidators.validateEmptyText("Username", value),
              decoration: const InputDecoration(hintText: "Name", prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
      
            ///Email
            TextFormField(
              controller: controller.email.value,
              validator: (value) => AppValidators.validateEmail(value),
              decoration: const InputDecoration(hintText: "Email", prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
      
            ///Password
            Obx(() => TextFormField(
                  controller: controller.password.value,
                  obscureText: controller.showPassword.value,
                  validator: (value) => AppValidators.validatePassword(value),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                        icon: Icon(controller.showPassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      )),
                )),
            const SizedBox(height: AppSizes.spaceBtwSections),
      
            ///Create account button
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.register(),
                child: controller.loading.value ? const Center(child: CircularProgressIndicator()) : const Text('Register'),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
