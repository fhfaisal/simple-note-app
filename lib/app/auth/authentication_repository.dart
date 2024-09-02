import 'package:caretutors/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/exceptions/firebase_auth_exceptions.dart';
import '../utils/exceptions/firebase_exceptions.dart';
import '../utils/exceptions/format_exceptions.dart';
import '../utils/exceptions/platform_exceptions.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final storage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    screenRedirect();
  }

  /// Check the user's session and onboarding status
  screenRedirect() async {
    User? currentUser = _auth.currentUser;
    final appStatus = await storage.read("isOnBoardingDone");

    if (currentUser != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      if (appStatus == true) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        storage.writeIfNull("isOnBoardingDone", true);
        Get.offAllNamed(Routes.SPLASH);
      }
    }
  }

  ///Login with email and password
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw AppFormatException(e.message);
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong please try again";
    }
  }
  ///SignUp with email and password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw AppFormatException(e.message);
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong please try again";
    }
  }


}