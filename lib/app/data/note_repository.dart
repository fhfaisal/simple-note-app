import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class NotesRepository extends GetxController {
  static NotesRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getNotes() {
    return _firestore.collection('notes').orderBy('createdAt').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'description': doc['description'],
        };
      }).toList();
    });
  }
  Future<void> addNote({
    required String title,
    required String description,
  }) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'description': description,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Error adding note: $e");
    }
  }

}
