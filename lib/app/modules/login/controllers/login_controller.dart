import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../auth/authentication_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snakbar/snackbar.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final hidePass = false.obs;
  final AuthenticationRepository _authRepo = Get.put(AuthenticationRepository());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Login using email and password
  Future<void> loginWithEmailAndPassword() async {
    try {
      ///Check Form Validations
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      ///Logged in by firebase
      await _authRepo.loginWithEmailAndPassword(email.value.text.trim(), password.value.text.trim());
      // Navigate to the home page
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      SnackBarMessage.warning(title: 'Oh Snap', message: e.toString());
    }
  }
}
