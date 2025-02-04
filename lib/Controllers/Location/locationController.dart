// import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationController {
//   final ValueNotifier<String> locationNotifier = ValueNotifier('Fetching location...');

//   Future<void> fetchLocation() async {
//     try {
//       // Check if location services are enabled
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         locationNotifier.value = 'Location services are disabled.';
//         return;
//       }

//       // Check for location permissions
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           locationNotifier.value = 'Location permissions are denied.';
//           return;
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         locationNotifier.value = 'Location permissions are permanently denied.';
//         return;
//       }

//       // Fetch the current location
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       locationNotifier.value =
//           'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
//     } catch (e) {
//       locationNotifier.value = 'Failed to get location: $e';
//     }
//   }
// }
