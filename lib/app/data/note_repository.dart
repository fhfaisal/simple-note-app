import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class NotesRepository extends GetxController {
  static NotesRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getNotes() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Filter notes by the logged-in user's UID
      return FirebaseFirestore.instance
          .collection('notes')
          .where('userId', isEqualTo: user.uid)
          .orderBy('createdAt', descending: true)
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
      // Return an empty stream if no user is logged in
      return const Stream.empty();
    }
  }

  Future<void> addNote({
    required String title,
    required String description,
  }) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'description': description,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      throw Exception("Error adding note: $e");
    }
  }

}
