import 'package:get/get.dart';

class BusinessController extends GetxController {
  /// Business name observable
  RxString businessName = "Business Name".obs;

  /// Tagline observable
  RxString tagline = "Tagline Entered by Manager or Owner of Business".obs;

  /// Description observable
  RxString description = "At [Business Name], we believe in empowering individuals to lead healthier and more fulfilling lives. Our tailored programs and state-of-the-art facilities are designed to help you achieve your fitness goals.".obs;

  /// 'About Us' section observable
  RxString aboutUsText = "We provide top-notch services to help individuals lead healthier lives.".obs;

  /// Updates business information dynamically
  void updateBusinessInfo(String name, String tag, String desc) {
    businessName.value = name;
    tagline.value = tag;
    description.value = desc;
  }

  /// Updates 'About Us' text dynamically
  void updateAboutUs(String newText) {
    if (newText.isNotEmpty) {
      aboutUsText.value = newText;
    }
  }
}
