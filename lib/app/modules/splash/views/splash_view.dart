import 'package:caretutors/app/modules/splash/controllers/splash_controller.dart';
import 'package:caretutors/app/modules/splash/views/skip_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dots.dart';
import 'next_button.dart';
import 'on_boarding.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = AppHelperFunction.isDarkMode(context);
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (value) => controller.updatePageIndicator(value),
              children: const [
                OnBoarding(title: "Title 1", subtitle: "Subtitle 1"),
                OnBoarding(title: "Title 2", subtitle: "Subtitle 2"),
                OnBoarding(title: "Title 3", subtitle: "Subtitle 3"),
              ],
            ),
            ///Skip Button
            const OnBoardingSkipButton(),
            ///Next Button
            const OnBoardingNextButton(),
            ///OnBoarding Dots
            const OnBoardingDots()
          ],
        ));
  }
}