// lib/models/membership_plan.dart
class MembershipPlan {
  final String name;
  final double price;
  final double rating;
  final int sessions;
  final int validityDays;
  final double pricePerSession;
  final List<String> features;
  final bool isRecommended;
  final bool showOuterLayer;
  final String outerLayerText;

  MembershipPlan({
    required this.name,
    required this.price,
    required this.rating,
    required this.sessions,
    required this.validityDays,
    required this.pricePerSession,
    required this.features,
    this.isRecommended = false,
    this.showOuterLayer = false,
    this.outerLayerText = "",
  });
}
