import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_view/utils/app_colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controllers/image_controller.dart';
import '../pages/fullscreen_page.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(
      init: ImageController(),
      builder: (controller) {
        return Obx(
          () => Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(2),
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      crossAxisCount: 4,
                      itemCount: controller.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        final imageBytes = controller.images[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FullScreenImage(imagePath: imageBytes),
                              ),
                            );
                          },
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3.0),
                              child:
                                  Image.memory(imageBytes, fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.getImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add from Gallery'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.textColor,
                          backgroundColor: AppColors.successColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.getImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Take Photo'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.textColor,
                          backgroundColor: AppColors.editButtonColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
