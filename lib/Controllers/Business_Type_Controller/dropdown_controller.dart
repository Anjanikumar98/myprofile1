import 'package:get/get.dart';

class DropdownController extends GetxController {
  final List<String> businessCategories = [
    'Gym/Fitness Centre',
    'Yoga Studio',
    'Wellness Center',
    'Mixed Martial Arts (MMA) & Boxing Gym',
    'Sports Academy Or Training Institute',
    'Dance/Fitness Class Studio',
    'Physiotherapy Clinic',
  ];

  var selectedCategory = ''.obs;

  void setSelectedCategory(String value) {
    selectedCategory.value = value;
  }
}