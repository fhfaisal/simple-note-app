import 'package:get/get.dart';

import '../../../data/note_repository.dart';

class HomeController extends GetxController {
  final NotesRepository _notesRepository = Get.put(NotesRepository());

  RxList<Map<String, dynamic>> notes = RxList([]);

  @override
  void onReady() {
    super.onReady();
    fetchNotes();
  }

  void fetchNotes() {
    _notesRepository.getNotes().listen((noteList) {
      notes.value = noteList;
    });
  }
}
