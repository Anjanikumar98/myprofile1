import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    // Get the device screen width and height for responsiveness
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Dropdown Example')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: deviceHeight * 0.05),
            // First RelativeLayout equivalent
            Container(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.15, // Adjust according to content
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF2F5B6C), // Add your desired color
              ),
              child: Center(
                child: Text(
                  'Property 1 Content', // Replace with actual content
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: deviceHeight * 0.05),
            // Dropdown container equivalent
            Container(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.06, // Adjust height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF2F5B6C),
              ),
              child: DropdownButton<String>(
                hint: const Text('Select Option'),
                style: TextStyle(color: Colors.white),
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
            SizedBox(height: deviceHeight * 0.05),
            // Another RelativeLayout equivalent (Option container)
            Container(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.4, // Adjust accordingly
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF2F5B6C),
              ),
              child: Center(
                child: Text(
                  'Option Container', // Replace with actual content
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
