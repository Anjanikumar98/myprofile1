import 'package:get/get.dart';

class MultiSelectController extends GetxController {
  // List of available features
  final List<String> availableFeatures = [
    "Strength Training",
    "Cardio Training",
    "Personal Training",
    "Group Classes"
  ];

  // Stores selected features
  var selectedFeatures = <String>[].obs;

  // Controls dropdown open/close state
  var isDropdownOpen = false.obs;

  // Toggles dropdown visibility
  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  // Handles item selection
  void selectFeature(String feature) {
    if (selectedFeatures.contains(feature)) {
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
    }
  }

  // Clears all selections
  void clearSelections() {
    selectedFeatures.clear();
  }
}
