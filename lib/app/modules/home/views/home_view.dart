import 'package:caretutors/app/utils/constants/colors.dart';
import 'package:caretutors/app/utils/constants/sizes.dart';
import 'package:caretutors/app/utils/helpers/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(left: AppSizes.defaultSpace/3),
          child: Text('Notes',style: Theme.of(context).textTheme.headlineLarge,),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
          child: GestureDetector(onTap: () => controller.logoutDialog(), child: const Icon(Iconsax.logout)),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Obx(() => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Obx(() => controller.notes.isNotEmpty
                ? ListView.separated(
                    itemCount: controller.notes.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),
                    itemBuilder: (context, index) {
                      final note = controller.notes[index];
                      return ListTile(
                        tileColor: AppColors.primary10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius8)),
                        title: Text(
                          note['title'],
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          note['description'],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppHelperFunction.getFormattedDate(
                                note['createdAt'] != null
                                    ? (note['createdAt'] as Timestamp).toDate()
                                    : DateTime.now(),
                              ),
                            ),
                            Text(
                              AppHelperFunction.getFormattedTime(
                                note['createdAt'] != null
                                    ? (note['createdAt'] as Timestamp).toDate()
                                    : DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      );
                    })
                : const Center(child: Text('No notes available.')))),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.ADD_NOTE),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: AppSizes.sm),
              Text('Add Note'),
            ],
          )),
    );
  }
}
