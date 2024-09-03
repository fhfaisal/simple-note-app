
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  ///Variables
  final PageController pageController = PageController(initialPage: 0);
  Rx<int> currentPage = 0.obs;
  final _storage=GetStorage();

  ///Update current index when page scroll
  void updatePageIndicator(int index) {
    currentPage.value = index;
  }

  ///Update current index and jump to the next page
  void nextPage() {
    if(currentPage.value==2){
      navigateToLogin();
    }else{
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }
  ///Update current index and jump to the last page
  void skipPage() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
    navigateToLogin();
  }

  navigateToLogin() {
    Get.offAllNamed(Routes.LOGIN);
    _storage.write("isOnBoardingDone", true);
  }
}

