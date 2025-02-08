import 'dart:ui';
import 'package:flutter/material.dart';
import '../Components/D1MM8_components/service_list.dart';

class ServicesSection extends StatelessWidget {
  final List<Map<String, dynamic>> services;

  const ServicesSection({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 398.55,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                child: const Icon(
                  Icons.diamond,
                  color: Colors.purple,
                  size: 20,
                ),
              ),
              const Text(
                'Services Section',
                style: TextStyle(
                  color: Color(0xFF9747FF),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: 372,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.44),
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/background_image_services.png',
                ),
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
              color: const Color(0x1AFFFFFF),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.44),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 14.31,
                  sigmaY: 14.31,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.61),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Explore our ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Services',
                              style: TextStyle(
                                color: Color(0xFF9FE870),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.58),
                      const Text(
                        'Provide a concise description of your offerings, highlighting key features and benefits.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ServiceList(services: services),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                // Handle previous
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                // Handle next
                              },
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
}