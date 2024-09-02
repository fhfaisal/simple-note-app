import 'package:caretutors/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final storage = GetStorage();
  @override
  void onReady() {
    screenRedirect();
  }

  /// Check and store onboarding status
  screenRedirect() async {
    final appStatus = await storage.read("isOnBoardingDone");
    if (appStatus == true) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SPLASH);
    }
  }


}