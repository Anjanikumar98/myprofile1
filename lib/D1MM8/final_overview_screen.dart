import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/D1MM8_components/Membership_section/Memembership_View/membership_view.dart';
import '../Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import '../Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import '../Components/D1MM8_components/Business_section/business_details.dart';
import '../Components/D1MM8_components/Contact_Section/contactus.dart';
import '../Components/D1MM8_components/reviews_container.dart';
import '../Components/D1MM8_components/Service_Section/services.dart';
import '../Controllers/D1MM8_Controllers/navbar_controller.dart';
import '../Components/D1MM8_components/fotter_component.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final ScrollController _scrollController = ScrollController();
  late final NavbarController _navbarController;

  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey membershipKey = GlobalKey();
  final GlobalKey trainersKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _navbarController = Get.put(NavbarController(_scrollController));
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

  // Consider adding this to handle controller disposal
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          // Custom AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: SafeArea(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),

                      // Logo and title using the same animated icon

                      Row(
                        children: [
                          Obx(() => Image.asset(
                                _navbarController.iconAssets[
                                    _navbarController.currentIcon.value],
                                width: 30,
                                height: 30,
                                color: const Color(0xFFA7FF46),
                              )),
                          const SizedBox(width: 10),
                          const Text(
                            'FlexFit',
                            style: TextStyle(
                              color: Color(0xFFA7FF46),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
