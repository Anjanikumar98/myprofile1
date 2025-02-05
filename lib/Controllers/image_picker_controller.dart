import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final _imagePicker = ImagePicker();
  final RxList<File> _pickedImages = <File>[].obs;
  final RxList<double> _uploadProgress = <double>[].obs;

  List<File> get pickedImages => _pickedImages;
  List<double> get uploadProgress => _uploadProgress;

  void pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      if (_pickedImages.length < 4) {
        _pickedImages.add(File(pickedFile.path));
        _uploadProgress.add(0.0);
      } else {
        Get.snackbar("Limit Reached", "You can upload a maximum of 4 images.", backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  void removeImage(int index) {
    _pickedImages.removeAt(index);
    _uploadProgress.removeAt(index);
  }

  void updateUploadProgress(int index, double progress) {
    _uploadProgress[index] = progress;
  }
}
