import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/services.dart';
import 'package:myprofile1/web_page_creation_form.dart';
import 'Components/D1CM6_componets/business_connections.dart';
import 'Components/D1CM6_componets/personal_detail.dart';
import 'Components/D1CM6_componets/personal_detail_form.dart';
import 'Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import 'Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import 'Components/D1MM8_components/contactus.dart';
import 'Components/global_components/character_input_fields/text_input_field.dart';
import 'Components/local_components/business_name.dart';
import 'Screens/D1CM6/business_connection_screen.dart';
import 'Screens/D1CM6/personal_detail_screen.dart';
import 'Screens/D1CM6/trainers_screen.dart';
import 'Screens/Final_Overview_Screen/final_overview.dart';
// import 'final_overview_screen.dart'; // Ensure this exists

final List<GetPage> appRoutes = [
  // GetPage(name: '/FinalScreen', page: () => FinalScreen()), // ✅ Ensure imported
  // GetPage(name: '/Services', page: () => Services()),
  // GetPage(name: '/ContactUsSection', page: () => ContactUsSection()),
  // GetPage(name: '/TrainersSection', page: () => TrainersSection()),
  // GetPage(name: '/VirtualTourSection', page: () => VirtualTourSection()),
  // GetPage(
  //     name: '/BusinessConnectionScreen',
  //     page: () => BusinessConnectionScreen()),
  // GetPage(name: '/TrainersScreen', page: () => TrainersScreen()),
  // GetPage(name: '/PersonalDetailForm', page: () => PersonalDetailForm()),
  // GetPage(name: '/PersonalDetailScreen', page: () => PersonalDetailScreen()),
  GetPage(name: '/FinalOverview', page: () => FinalOverview()), // ✅ Route is correct
];
