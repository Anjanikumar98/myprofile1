import 'package:flutter/material.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/buttons/secondary_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryButton(
            width: 75,
            height: 45,
            secondaryText: 'Back',
            isEnabled: true,
            isPrimary: true,
            hasIcon: false,
            OnTap: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          PrimaryButton(
            buttonWidth: 150,
            buttonHeight: 40,
            buttonText: "Make it Live",
            onTap: () {
              // Implement "Make it Live" action
            },
            isEnabled: true,
          ),
        ],
      ),
    );
  }
}
