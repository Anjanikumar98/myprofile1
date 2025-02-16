import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/D1MM8_components/Membership_section/membership_view.dart';
import 'Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import 'Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import 'Components/D1MM8_components/business_details.dart';
import 'Components/D1MM8_components/contactus.dart';
import 'Components/D1MM8_components/reviews_container.dart';
import 'Components/D1MM8_components/services.dart';
import 'Controllers/D1MM8_Controllers/navbar_controller.dart';
import 'Screens/fotter_screen.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final ScrollController _scrollController = ScrollController();

  // Initialize NavbarController
  late final NavbarController _navbarController;

  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey membershipKey = GlobalKey();
  final GlobalKey trainersKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _navbarController =
        Get.put(NavbarController(_scrollController)); // Inject controller
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(onItemSelected: (String section) {
        _scrollToSection(getSectionKey(section));
      }),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              BusinessDetails(),
              Container(key: servicesKey, child: Services()),
              VirtualTourSection(),
              Container(key: membershipKey, child: MembershipPlansView()),
              Container(key: trainersKey, child: TrainersSection()),
              ReviewsContainer(),
              Container(key: contactKey, child: ContactUsSection()),
              FlexFitFooter(),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text("FlexFit"),
              backgroundColor: Colors.green,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GlobalKey getSectionKey(String section) {
    switch (section) {
      case "Services":
        return servicesKey;
      case "Membership":
        return membershipKey;
      case "Trainers":
        return trainersKey;
      case "Contact Us":
        return contactKey;
      default:
        return servicesKey;
    }
  }
}
