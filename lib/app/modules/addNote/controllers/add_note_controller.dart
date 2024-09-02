import 'package:caretutors/app/data/note_repository.dart';
import 'package:caretutors/app/routes/app_pages.dart';
import 'package:caretutors/app/utils/snakbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNoteController extends GetxController {
  final NotesRepository _notesRepository = Get.put(NotesRepository());

  final title = TextEditingController();
  final description = TextEditingController();

  void addNote() async {
    if (title.text.isEmpty || description.text.isEmpty) {
      SnackBarMessage.warning(title: 'Opss', message: 'Title and Description cannot be empty');
      return;
    }

    try {
      await _notesRepository.addNote(
        title: title.text,
        description: description.text,
      );
      SnackBarMessage.warning(title: 'Success', message: 'Your note successfully add to the list');
      Get.offAllNamed(Routes.HOME);// Navigate back to Home Page
    } catch (e) {
      SnackBarMessage.error(title: 'Error',message: 'Failed to add note: $e');
    }
  }
}
