import 'package:caretutors/app/data/note_repository.dart';
import 'package:caretutors/app/routes/app_pages.dart';
import 'package:caretutors/app/utils/snakbar/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNoteController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addNote() async {
    try {
      if (title.text.isEmpty || description.text.isEmpty) {
        SnackBarMessage.warning(title: 'Opss', message: 'Title and Description cannot be empty');
        return;
      }
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('notes').add({
          'title': title.text,
          'description': description.text,
          'userId': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
        SnackBarMessage.success(title: 'Success', message: 'Your note successfully add to the list');
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      SnackBarMessage.error(title: 'Error', message: 'Failed to add note: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getNotes() {
    final user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('notes')
          .where('userId', isEqualTo: user.uid) // Filter by userId
          .orderBy('createdAt')
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'title': doc['title'],
            'description': doc['description'],
          };
        }).toList();
      });
    } else {
      SnackBarMessage.error(title: 'Error', message: 'Failed to add note');
      return const Stream.empty();
    }
  }
}
