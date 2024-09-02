import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: Obx(() {
          if (controller.notes.isEmpty) {
            return const Center(child: Text('No notes available.'));
          }
          return ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              final note = controller.notes[index];
              return ListTile(
                title: Text(note['title']),
                subtitle: Text(note['description']),
                onTap: () {
                  // Optionally handle tap events
                },
              );
            },
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE); // Navigate to Add Notes Page
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
