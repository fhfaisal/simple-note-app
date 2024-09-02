import 'package:caretutors/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
class OnBoardingDots extends GetView<SplashController> {
  const OnBoardingDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppDeviceUtility.getBottomNavigationBarHeight() + 25,
        left: AppSizes.defaultSpace,
        child: Center(
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              effect: const ExpandingDotsEffect(activeDotColor: AppColors.primary, dotHeight: 10),
            )));
  }
}