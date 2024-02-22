import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_view/utils/app_colors.dart';
import '../controllers/image_controller.dart';

class FullScreenImage extends StatelessWidget {
  final Uint8List imagePath;

  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.find<ImageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fullscreen Gambar', style: TextStyle(color: AppColors.textColor),),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          style: const ButtonStyle(iconColor: MaterialStatePropertyAll(AppColors.textColor)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    child: Image.memory(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(() => Text(
                          imageController.imageName.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondColor,
                          ),
                        )),
                    const SizedBox(height: 8),
                    Obx(() => Text(
                          'Tanggal : ${imageController.imageDate.value}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
