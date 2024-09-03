import 'package:caretutors/app/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/authentication_repository.dart';
import '../../../data/note_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/sizes.dart';

class HomeController extends GetxController {
  final noteRepo = Get.put(NotesRepository());
  final AuthenticationRepository _authRepo = Get.put(AuthenticationRepository());
  var notes = <Map<String, dynamic>>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  void fetchNotes() {
    noteRepo.getNotes().listen((fetchedNotes) {
      notes.assignAll(fetchedNotes);
      loading.value = false;
    });
  }

  Future<void> logOut() async {
    try {
      await _authRepo.logout();
      notes.clear();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar('Error', 'Failed to log out: $e');
    }
  }

  logoutDialog() {
    Get.dialog(
        barrierDismissible: true,
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Logout', style: Theme.of(Get.context!).textTheme.headlineLarge!.apply(color: AppColors.error)),
                Text('Are you sure?', style: Theme.of(Get.context!).textTheme.titleMedium),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  height: AppSizes.buttonHeight - 10,
                  child: Row(
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () => logOut, child: const Text("Yes"))),
                      const SizedBox(width: AppSizes.sm),
                      Expanded(child: OutlinedButton(onPressed: () => Get.back() ,child: const Text("Close"))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
