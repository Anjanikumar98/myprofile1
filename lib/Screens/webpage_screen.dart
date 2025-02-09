// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:myprofile1/Screens/business_name_screen.dart';
// // // // import '../Components/D1MM8_components/final_overview_Section.dart';
// // // // import '../Controllers/D1MM8_Controllers/webpage_controller.dart';
// // // // import '../Controllers/D1MM8_Controllers/scroll_controller.dart';
// // // // import '../Components/global_components/buttons/action_button.dart';
// // // // import '../Components/terms_condition.dart';
// // // // import '../Components/D1MM8_components/header_section.dart';
// // // // import '../Controllers/D1MM8_Controllers/widets/navbar.dart';
// // // // import 'aboutus.dart';
// // // //
// // // // class WebPageScreen extends StatelessWidget {
// // // //   final WebPageController controller = Get.put(WebPageController());
// // // //   final ScrollControllerX scrollControllerX = Get.put(ScrollControllerX());
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             /// ✅ Header Section
// // // //             HeaderSection(),
// // // //
// // // //             /// ✅ Scrollable Content
// // // //             Expanded(
// // // //               child: SingleChildScrollView(
// // // //                 controller: scrollControllerX.scrollController,
// // // //                 child: Column(
// // // //                   children: [
// // // //                     SizedBox(height: 16),
// // // //                     FinalOverviewSection(),
// // // //                     SizedBox(height: 20),
// // // //
// // // //                     /// ✅ Content with Navbar
// // // //                     Stack(
// // // //                       alignment: Alignment.topCenter,
// // // //                       children: [
// // // //                         BusinessNameScreen(),
// // // //                         SizedBox(height: 10,),
// // // //                         NavbarWithMenu(),
// // // //                         Padding(
// // // //                           padding: EdgeInsets.symmetric(horizontal: 16.0),
// // // //                           child: Column(
// // // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // // //                             children: [
// // // //                               SizedBox(height: 450),
// // // //                               TermsConditions(),
// // // //                               ActionButtons(),
// // // //                             ],
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'Screens/business_name_screen.dart';
// // // import 'Screens/final_screen_overview.dart';
// // // import 'Screens/fotter_screen.dart';
// // // import 'Screens/services.dart';
// // // import 'Screens/webpage_screen.dart';
// // // import 'web_page_creation_form.dart';
// // //
// // // // Define services list at the top level
// // // final services = [
// // //   {
// // //     'title': 'Heart Health',
// // //     'description': 'Boost your cardiovascular endurance with heart-focused fitness plans.',
// // //     'icon': Icons.favorite,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //   {
// // //     'title': 'Training',
// // //     'description': 'Achieve faster results with one-on-one coaching from experienced personal trainers.',
// // //     'icon': Icons.fitness_center,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //   {
// // //     'title': 'Fitness Classes',
// // //     'description': 'Stay motivated with fun and interactive group sessions led by certified instructors.',
// // //     'icon': Icons.favorite,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //   {
// // //     'title': 'Nutrition Counselling ',
// // //     'description': 'A healthy diet is key to achieving your fitness goals. \n Get expert advice',
// // //     'icon': Icons.favorite,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //   {
// // //     'title': 'Locker Services',
// // //     'description': 'A healthy diet is key to achieving your fitness goals. \n Get expert advice',
// // //     'icon': Icons.favorite,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //   {
// // //     'title': 'Wellness',
// // //     'description': 'Take care of your mind and body with dedicated wellness services Guided.',
// // //     'icon': Icons.favorite,
// // //     'width': 180.0,
// // //     'height': 185.0,
// // //   },
// // //
// // //   // Add more services as needed
// // // ];
// // //
// // // final List<GetPage> appRoutes = [
// // //   GetPage(
// // //     name: '/webpage',
// // //     page: () => const WebPageCreationForm(),
// // //   ),
// // //   GetPage(
// // //     name: '/business_name',
// // //     page: () => BusinessNameScreen(),
// // //   ),
// // //   GetPage(
// // //     name: '/services',
// // //     page: () => ServicesSection(services: services), // Pass the services list
// // //   ),
// // //   GetPage(
// // //     name: '/footer',
// // //     page: () => const FooterScreen(),
// // //   ),
// // //   GetPage(
// // //     name: '/overview',
// // //     page: () => const FinalScreenOverview(),
// // //   ),
// // //   GetPage(name: '/webPageScreen', page: () => WebPageScreen()),
// // // ];
// // //
// // // class FinalScreenOverview extends StatelessWidget {
// // //   const FinalScreenOverview({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const Scaffold(
// // //       body: Center(child: Text("Final Screen Overview")),
// // //     );
// // //   }
// // // }
// // //
// // // class FooterScreen extends StatelessWidget {
// // //   const FooterScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const Scaffold(
// // //       body: Center(child: Text("Footer Screen")),
// // //     );
// // //   }
// // // }
// // //
// // // class WebPageCreationForm extends StatelessWidget {
// // //   const WebPageCreationForm({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const Scaffold(
// // //       body: Center(child: Text("Web Page Creation Form")),
// // //     );
// // //   }
// // // }
// //
// //
// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import '../Components/D1MM8_components/service_list.dart';
// //
// // class ServicesSection extends StatelessWidget {
// //   final List<Map<String, dynamic>> services;
// //
// //   const ServicesSection({
// //     Key? key,
// //     required this.services,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 412,
// //       height: 398.55,
// //       padding: const EdgeInsets.symmetric(horizontal: 20),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Section Title
// //           Stack(
// //             children: [
// //               // Background Text
// //               Positioned(
// //                 top: 0, // Adjust as needed
// //                 left: 0, // Adjust as needed
// //                 child: Text(
// //                   'Services',
// //                   style: TextStyle(
// //                     fontFamily: 'Inter',
// //                     fontSize: 40,
// //                     fontWeight: FontWeight.w700,
// //                     height: 48.41 / 40, // To match the line-height
// //                     letterSpacing: 0,
// //                     color: const Color(0xF4F4F44D), // Transparent off-white
// //                   ),
// //                 ),
// //               ),
// //               // Foreground Heading
// //               Positioned(
// //                 top: 20, // Adjust to align over the background text
// //                 left: 0,
// //                 child: RichText(
// //                   text: const TextSpan(
// //                     children: [
// //                       TextSpan(
// //                         text: 'Explore our ',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 32,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       TextSpan(
// //                         text: 'Services',
// //                         style: TextStyle(
// //                           color: Color(0xFF9FE870),
// //                           fontSize: 32,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //
// //           const SizedBox(height: 10),
// //
// //           // Blurred Background Section
// //           Stack(
// //             children: [
// //               // Background Image
// //               Container(
// //                 width: double.infinity,
// //                 height: 372,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(11.44),
// //                   image: const DecorationImage(
// //                     image: AssetImage('assets/images/background_image_services.png'),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //               // Dark Overlay
// //               Container(
// //                 width: double.infinity,
// //                 height: 372,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(11.44),
// //                   color: Colors.black.withOpacity(0.5),
// //                 ),
// //               ),
// //
// //               // Content with Blur
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(11.44),
// //                 child: BackdropFilter(
// //                   filter: ImageFilter.blur(sigmaX: 14.31, sigmaY: 14.31),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(28.61),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Heading
// //                         RichText(
// //                           text: const TextSpan(
// //                             children: [
// //                               TextSpan(
// //                                 text: 'Explore our ',
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 32,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                               TextSpan(
// //                                 text: 'Services',
// //                                 style: TextStyle(
// //                                   color: Color(0xFF9FE870),
// //                                   fontSize: 32,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         const SizedBox(height: 8.58),
// //
// //                         // Subtitle
// //                         const Text(
// //                           'Provide a concise description of your offerings, highlighting key features and benefits.',
// //                           style: TextStyle(
// //                             color: Colors.white70,
// //                             fontSize: 14,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 20),
// //
// //                         // Service Cards
// //                         ServiceList(services: services),
// //                         const SizedBox(height: 20),
// //
// //                         // Navigation Arrows
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             _buildArrowButton(Icons.arrow_back, () {
// //                               // Implement Scroll Left
// //                             }),
// //                             const SizedBox(width: 10),
// //                             _buildArrowButton(Icons.arrow_forward, () {
// //                               // Implement Scroll Right
// //                             }),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Navigation Arrow Button
// //   Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
// //     return Container(
// //       width: 40,
// //       height: 40,
// //       decoration: BoxDecoration(
// //         shape: BoxShape.circle,
// //         border: Border.all(color: Colors.white.withOpacity(0.2)),
// //       ),
// //       child: IconButton(
// //         icon: Icon(icon, color: Colors.white, size: 20),
// //         onPressed: onTap,
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Components/global_components/buttons/primary_button.dart';
// import '../Controllers/D1MM8_Controllers/business_controller.dart';
// import '../utils/color_constants.dart';
//
// class BusinessNameScreen extends StatelessWidget {
//   BusinessNameScreen({Key? key}) : super(key: key);
//
//   /// Register BusinessController
//   final BusinessController controller = Get.put(BusinessController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 🌆 Background Image with Overlay
//           Positioned.fill(
//             child: Image.asset(
//               "assets/images/background_image_header.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.5), // ✅ Better overlay method
//             ),
//           ),
//
//           // 🌫️ Inner Blurred Card
//           Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 2.86, sigmaY: 2.86),
//                 child: Container(
//                   width: 382,
//                   height: 600, // Adjusted height
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // 📌 Business Name
//                       Obx(() => Text(
//                         controller.businessName.value.isNotEmpty
//                             ? controller.businessName.value
//                             : "Business Name",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                           color: ColorConstant.primaryGreen,
//                         ),
//                       )),
//
//                       const SizedBox(height: 8),
//
//                       // 📌 Tagline
//                       Obx(() => RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Tagline ",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontStyle: FontStyle.italic,
//                                 fontWeight: FontWeight.w500,
//                                 color: ColorConstant.primaryGreen,
//                               ),
//                             ),
//                             TextSpan(
//                               text: controller.tagline.value.isNotEmpty
//                                   ? controller.tagline.value
//                                   : "Entered by Manager or Owner of Business",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontStyle: FontStyle.italic,
//                                 fontWeight: FontWeight.w400,
//                                 color: ColorConstant.pureWhite,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//
//                       const SizedBox(height: 16),
//
//                       // 📌 Business Description
//                       Obx(() => Text(
//                         controller.description.value.isNotEmpty
//                             ? controller.description.value
//                             : "At [Business Name], we believe in empowering individuals to lead healthier and more fulfilling lives. Our tailored programs and state-of-the-art facilities are designed to help you achieve your fitness goals.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           height: 1.4,
//                           color: ColorConstant.pureWhite,
//                         ),
//                       )),
//
//                       const SizedBox(height: 24),
//
//                       // 📌 Get Started Button
//                       SizedBox(
//                         width: 160,
//                         child: PrimaryButton(
//                           buttonWidth: 160,
//                           buttonHeight: 42,
//                           buttonText: 'Get Started',
//                           isEnabled: true,
//                           borderColor:
//                           ColorConstant.primaryGreen, // ✅ Matched UI
//                           borderWidth: 2,
//                           onTap: () {
//                             controller.updateBusinessInfo(
//                               "New Business",
//                               "Your New Tagline",
//                               "We are updating our business description dynamically!",
//                             );
//                           },
//                           icon: const Padding(
//                             padding: EdgeInsets.only(top: 3),
//                             child: Icon(
//                               Icons.arrow_outward,
//                               color: Colors.black,
//                               size: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
