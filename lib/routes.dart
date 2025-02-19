import 'package:get/get.dart';
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

  GetPage(
      name: '/FinalOverview',
      page: () => FinalOverview()), // ✅ Route is correct
];
