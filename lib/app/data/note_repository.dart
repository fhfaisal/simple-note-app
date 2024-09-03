import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotesRepository extends GetxController {
  static NotesRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getNotes() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        // Filter notes by the logged-in user's UID
        return FirebaseFirestore.instance
            .collection('notes')
            .where('userId', isEqualTo: user.uid)
            .orderBy('createdAt', descending: true)
            .snapshots()
            .map((querySnapshot) {
          return querySnapshot.docs.map((doc) {
            final data = doc.data();
            return {
              'id': doc.id,
              'title': data['title'] ?? 'Untitled',
              'description': data['description'] ?? 'No description',
              'createdAt': data['createdAt'], // Add if you need to display this
            };
          }).toList();
        });
      } catch (e) {
        // Handle any stream-related errors
        print('Error fetching notes: $e');
        return const Stream.empty();
      }
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
      // Get the current user's UID
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User is not authenticated");
      }

      await _firestore.collection('notes').add({
        'title': title,
        'description': description,
        'userId': user.uid,
        'time': DateTime.now(),
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
      throw Exception("Error adding note: $e");
    }
  }
}
