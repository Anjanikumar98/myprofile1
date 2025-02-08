import 'package:flutter/material.dart';
import 'mobile_service_cards.dart';


class ServiceList extends StatelessWidget {
  final List<Map<String, dynamic>> services;

  const ServiceList({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height based on card size
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MobileServiceCard(
              width: services[index]['width'] ?? 180,
              height: services[index]['height'] ?? 185,
              title: services[index]['title'] ?? 'Service',
              description: services[index]['description'] ?? '',
              icon: services[index]['icon'] ?? Icons.help_outline,
            ),
          );
        },
      ),
    );
  }
}


