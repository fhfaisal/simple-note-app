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
                OnBoarding(title: "Your Digital Notebook", subtitle: "Capture and organize your thoughts, ideas, and tasks effortlessly."),
                OnBoarding(title: "Customize Your Notes", subtitle: "Add tags, set reminders, and personalize your notes to suit your style."),
                OnBoarding(title: "Sync Across Devices", subtitle: "Access your notes from anywhere with our seamless cloud synchronization."),
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