import 'package:caretutors/app/utils/snakbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../auth/authentication_repository.dart';

class RegistrationController extends GetxController {
  /// Text Controller
  final username = TextEditingController().obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  ///Form Key
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///Variables
  final showPassword = true.obs;

  /// Register user in the Firebase Authentication & Save user data in the Firebase
  register() async {
    if(!signUpFormKey.currentState!.validate())return;
    try{
      await AuthenticationRepository.instance.registerUser(
        name: username.value.text,
        email: email.value.text,
        password: password.value.text,
      );

    }catch(e){
      SnackBarMessage.error(title: "Error",message: e);
    }
  }
}
