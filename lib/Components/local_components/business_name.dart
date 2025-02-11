import 'dart:ui';
import 'package:flutter/material.dart';

class BusinessName extends StatelessWidget {
  final String businessName, rating, city, state, businessType;
  final double iconSize, borderRadius;
  final IconData icon;
  final Color backgroundColor,
      iconBackgroundColor,
      textColor,
      ratingColor,
      businessTypeColor;
  final EdgeInsets padding;

  const BusinessName({
    super.key,
    this.businessName = 'Business Name',
    this.rating = '4.0',
    this.city = 'City',
    this.state = 'State',
    this.businessType = 'Business Type',
    this.iconSize = 22,
    this.icon = Icons.business,
    this.backgroundColor = const Color(0xFF4C5B2F),
    this.iconBackgroundColor = const Color(0xFFC4F232),
    this.textColor = Colors.white,
    this.ratingColor = Colors.white,
    this.businessTypeColor = const Color(0xFFC4F232),
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > 0 ? constraints.maxWidth : 310;
        double height = width * 0.25; // Adaptive height

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              width: width,
              padding: padding,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: height * 0.6,
                    height: height * 0.6,
                    padding: EdgeInsets.all(height * 0.12),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Colors.black, size: iconSize),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          businessName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Barlow Semi Condensed',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            fontSize: height * 0.22,
                            color: textColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              rating,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: height * 0.16,
                                color: ratingColor,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Image.asset(
                              'assets/images/icons/Star Mini Unit Component.png',
                              width: height * 0.16,
                              height: height * 0.16,
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.location_on,
                                color: Colors.white, size: 14),
                            Text(
                              '$city, $state',
                              style: TextStyle(
                                fontSize: height * 0.14,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: height * 0.06,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                color: businessTypeColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              businessType,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.12,
                                color: businessTypeColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
