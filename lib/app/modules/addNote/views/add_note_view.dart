import 'package:caretutors/app/utils/constants/colors.dart';
import 'package:caretutors/app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  const AddNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.headlineMedium,
              controller: controller.title,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.tertiaryText),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black)),
                border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.tertiaryText)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.tertiaryText)),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                controller: controller.description,
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.tertiaryText),
                  focusedBorder:InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                maxLines: 30,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: controller.addNote,
                child: const Text('Add Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
