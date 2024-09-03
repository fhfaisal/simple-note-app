import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/note_repository.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final noteRepo=Get.put(NotesRepository());
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
    await FirebaseAuth.instance.signOut();
    notes.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
