import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/services.dart';
import 'Components/D1CM6_componets/business_connections.dart';
import 'Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import 'Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import 'Components/D1MM8_components/contactus.dart';
import 'Components/local_components/business_name.dart';
import 'Screens/D1CM6/business_connection_screen.dart';
import 'final_overview_screen.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/FinalScreen', page: () => FinalScreen()),
  // GetPage(name: '/Services', page: () => Services()),
  // GetPage(name: '/ContactUsSection', page: () => ContactUsSection()),
  // GetPage(name: '/TrainersSection', page: () => TrainersSection()),
  // GetPage(name: '/VirtualTourSection', page: () => VirtualTourSection()),
  GetPage(name: '/BusinessConnectionScreen', page: () => BusinessConnectionScreen()),
];
