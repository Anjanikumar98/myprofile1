import 'package:get/get.dart';

class BusinessTypeController extends GetxController {
  // List of business types from app data
  var businessTypes = ['Fitness Center', 'Yoga Studio', 'Gym', 'Dance Academy'].obs;

  // Initially selected business type
  var selectedBusinessType = 'Fitness Center'.obs;

  // Method to update the selected business type
  void updateBusinessType(String newType) {
    selectedBusinessType.value = newType;
  }

  // Example function to fetch business types (can be from an API or database)
  Future<void> fetchBusinessTypes() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating an API call
    businessTypes.value = ['Fitness Center', 'Yoga Studio', 'Gym', 'Dance Academy', 'Boxing Center'];
  }
}
