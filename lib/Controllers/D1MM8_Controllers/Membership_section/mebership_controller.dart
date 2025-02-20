import 'package:get/get.dart';
import '../../../Components/D1MM8_components/Membership_section/Membership_Card/membership_model.dart';

class MembershipController extends GetxController {
  var membershipPlans = <MembershipPlanModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMembershipPlans();
  }

  void loadMembershipPlans() {
    membershipPlans.assignAll([
      MembershipPlanModel(
        hoverText: "",
        isRecommended: false,
      ),
      MembershipPlanModel(
        hoverText: "Recommended",
        isRecommended: true,
      ),
      MembershipPlanModel(
        hoverText: "",
        isRecommended: false,
      ),
      MembershipPlanModel(
        hoverText: "Recommended",
        isRecommended: true,
      ),
    ]);
  }
}
