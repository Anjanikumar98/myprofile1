import 'package:get/get.dart';
import '../Models/business_model.dart';

class BusinessController extends GetxController {
  /// Observable for Business Model
  Rx<BusinessModel> business = BusinessModel(
    businessName: "Business Name",
    tagline: "Tagline Entered by Manager or Owner of Business",
    description:
    "At [Business Name], we believe in empowering individuals to lead healthier and more fulfilling lives. Our tailored programs and state-of-the-art facilities are designed to help you achieve your fitness goals.",
  ).obs;

  /// 'About Us' section observable
  RxString aboutUsText = "We provide top-notch services to help individuals lead healthier lives.".obs;

  /// Updates business information dynamically
  void updateBusinessInfo(String name, String tag, String desc) {
    business.value = BusinessModel(
      businessName: name,
      tagline: tag,
      description: desc,
    );
  }

  /// Updates 'About Us' text dynamically
  void updateAboutUs(String newText) {
    if (newText.isNotEmpty) {
      aboutUsText.value = newText;
    }
  }
}
