import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlexFitFooter extends StatelessWidget {
  const FlexFitFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo and Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Property 1=Ballerina.png'),
              // Icon(
              //   Icons.fitness_center,
              //   color: Colors.limeAccent,
              //   size: 28,
              // ),
              const SizedBox(width: 8),
              Text(
                'FlexFit',
                style: TextStyle(
                  color: Colors.limeAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Navigation Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: _navLink('Services'),
                onTap: () {},
              ),
              InkWell(
                child: _navLink('Membership'),
                onTap: () {},
              ),
              InkWell(
                child: _navLink('Trainers'),
                onTap: () {},
              ),
              InkWell(
                child: _navLink('Contact Us'),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: _socialIcon(FontAwesomeIcons.facebookF),
                onTap: () {},
              ),
              InkWell(
                child: _socialIcon(FontAwesomeIcons.instagram),
                onTap: () {},
              ),
              InkWell(
                child: _socialIcon(FontAwesomeIcons.xTwitter),
                onTap: () {},
              ),
              InkWell(
                child: _socialIcon(FontAwesomeIcons.linkedinIn),
                onTap: () {},
              ),
              InkWell(
                child: _socialIcon(FontAwesomeIcons.youtube),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Divider Line
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white24,
            margin: const EdgeInsets.symmetric(vertical: 16),
          ),

          // Powered by Membes
          Text(
            'Powered by Membes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Footer Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: _footerLink('Privacy Policy'),
                onTap: () {},
              ),
              InkWell(
                child: _footerLink('Terms of Service'),
                onTap: () {},
              ),
              InkWell(
                child: _footerLink('Cookies Settings'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        icon,
        color: Colors.limeAccent,
        size: 22,
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
