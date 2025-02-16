import 'dart:io';
import 'package:flutter/material.dart';

class TrainerModel {
  final String imageUrl;
  final String name;
  final String position;
  final String description;

  TrainerModel({
    required this.imageUrl,
    required this.name,
    required this.position,
    required this.description,
  });

  /// Helper method to determine the image type
  Widget getImageWidget() {
    if (imageUrl.startsWith("http") || imageUrl.startsWith("https")) {
      return Image.network(imageUrl, fit: BoxFit.cover);
    } else if (imageUrl.startsWith("/")) {
      return Image.file(File(imageUrl), fit: BoxFit.cover);
    } else {
      return Image.asset(imageUrl, fit: BoxFit.cover);
    }
  }
}
