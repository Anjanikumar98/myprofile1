import 'package:get/get.dart';
import 'package:myprofile1/controllers/d1mm8_controllers/webpage_controller.dart';



class WebpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebPageController>(() => WebPageController());
  }
}
