// ignore_for_file: deprecated_member_use

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:responsive_view/utils/app_colors.dart';

import '../pages/add_image_page.dart';
import '../pages/home_page.dart';

class ImageController extends GetxController {
  final RxList<Uint8List> images = <Uint8List>[].obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  RxString imageName = ''.obs;
  RxString imageDate = ''.obs;

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      images.add(bytes);

      Get.off(() => AddImagePage());
    }
  }

  void addImage() {
    final String name = nameController.text;
    final String date = dateController.text;

    if (name.isEmpty || date.isEmpty) {
      Get.snackbar(
        'Error',
        'Please provide image name and date.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.warningColor,
        colorText: AppColors.textColor,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    imageName.value = name;
    imageDate.value = date;

    Get.off(() => const HomePage());
    nameController.clear();
    dateController.clear();
  }
}
