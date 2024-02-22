import 'package:get/get.dart';
import 'package:responsive_view/controllers/image_controller.dart';


class ImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ImageController());
  }
}
