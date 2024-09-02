
import 'package:caretutors/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class OnBoardingSkipButton extends GetView<SplashController> {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDeviceUtility.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onLongPress: () => controller.navigateToLogin(),
        onPressed: () => controller.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}