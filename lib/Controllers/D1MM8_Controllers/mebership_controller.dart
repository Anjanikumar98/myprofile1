import 'package:get/get.dart';
import '../../Components/D1MM8_components/Membership_section/membership_model.dart';

class MembershipController extends GetxController {
  var selectedPeriod = 'Monthly'.obs;
  var plans = <MembershipPlan>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPlans();
  }

  void loadPlans() {
    plans.value = [
      MembershipPlan(
        name: "Session-Based Plan",
        price: 4000,
        rating: 4.0,
        sessions: 30,
        validityDays: 90,
        pricePerSession: 100,
        features: [
          "Feature 1",
          "Feature 2",
          "Feature 3",
          "Feature 4",
          "Feature 5",
        ],
        isRecommended: false,
        showOuterLayer: false,
        outerLayerText: "",
      ),
      MembershipPlan(
        name: "Session-Based Plan",
        price: 4000,
        rating: 4.0,
        sessions: 30,
        validityDays: 90,
        pricePerSession: 100,
        features: [
          "Feature 1",
          "Feature 2",
          "Feature 3",
          "Feature 4",
          "Feature 5",
        ],
        isRecommended: true,
        showOuterLayer: true,
        outerLayerText: "Recommended",
      ),
      MembershipPlan(
        name: "Period-Based Plan",
        price: 4000,
        rating: 4.0,
        sessions: 30,
        validityDays: 90,
        pricePerSession: 100,
        features: [
          "Feature 1",
          "Feature 2",
          "Feature 3",
          "Feature 4",
          "Feature 5",
        ],
        isRecommended: false,
        showOuterLayer: false,
        outerLayerText: "",
      ),
      MembershipPlan(
        name: "Period-Based Plan",
        price: 4000,
        rating: 4.0,
        sessions: 30,
        validityDays: 90,
        pricePerSession: 100,
        features: [
          "Feature 1",
          "Feature 2",
          "Feature 3",
          "Feature 4",
          "Feature 5",
        ],
        isRecommended: true,
        showOuterLayer: true,
        outerLayerText: "Recommended",
      ),
    ];
  }

  void changePeriod(String period) {
    selectedPeriod.value = period;
  }
}
