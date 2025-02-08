import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/business_name_screen.dart';
import 'Screens/final_screen_overview.dart';
import 'Screens/fotter_screen.dart';
import 'Screens/services.dart';
import 'Screens/webpage_screen.dart';
import 'web_page_creation_form.dart';

// Define services list at the top level
final services = [
  {
    'title': 'Heart Health',
    'description': 'Boost your cardiovascular endurance with heart-focused fitness plans.',
    'icon': Icons.favorite,
    'width': 180.0,
    'height': 185.0,
  },
  {
    'title': 'Training',
    'description': 'Achieve faster results with one-on-one coaching from experienced personal trainers.',
    'icon': Icons.fitness_center,
    'width': 180.0,
    'height': 185.0,
  },
  {
    'title': 'Fitness Classes',
    'description': 'Stay motivated with fun and interactive group sessions led by certified instructors.',
    'icon': Icons.favorite,
    'width': 180.0,
    'height': 185.0,
  },
  {
    'title': 'Nutrition Counselling ',
    'description': 'A healthy diet is key to achieving your fitness goals. \n Get expert advice',
    'icon': Icons.favorite,
    'width': 180.0,
    'height': 185.0,
  },
  {
    'title': 'Locker Services',
    'description': 'A healthy diet is key to achieving your fitness goals. \n Get expert advice',
    'icon': Icons.favorite,
    'width': 180.0,
    'height': 185.0,
  },
  {
    'title': 'Wellness',
    'description': 'Take care of your mind and body with dedicated wellness services Guided.',
    'icon': Icons.favorite,
    'width': 180.0,
    'height': 185.0,
  },

  // Add more services as needed
];

final List<GetPage> appRoutes = [
  GetPage(
    name: '/webpage',
    page: () => const WebPageCreationForm(),
  ),
  GetPage(
    name: '/business_name',
    page: () => BusinessNameScreen(),
  ),
  GetPage(
    name: '/services',
    page: () => ServicesSection(services: services), // Pass the services list
  ),
  GetPage(
    name: '/footer',
    page: () => const FooterScreen(),
  ),
  GetPage(
    name: '/overview',
    page: () => const FinalScreenOverview(),
  ),
  GetPage(name: '/webPageScreen', page: () => WebPageScreen()),
];

class FinalScreenOverview extends StatelessWidget {
  const FinalScreenOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Final Screen Overview")),
    );
  }
}

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Footer Screen")),
    );
  }
}

class WebPageCreationForm extends StatelessWidget {
  const WebPageCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Web Page Creation Form")),
    );
  }
}