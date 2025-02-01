import 'package:flutter/material.dart';

class WebPageCreationForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController taglineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController socialLinksController = TextEditingController();
  final TextEditingController trainerNameController = TextEditingController();

  // Sample options for business type and services
  final List<String> businessTypes = ['Fitness Center', 'Yoga Studio', 'Other'];
  final List<String> services = [
    'Personal Training',
    'Yoga Classes',
    'Group Classes'
  ];

  WebPageCreationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page Creation Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Name (Auto-filled from app data)
              TextFormField(
                controller: businessNameController,
                decoration: InputDecoration(labelText: 'Business Name'),
                enabled: false,
              ),

              // Business Type (Dropdown)
              DropdownButtonFormField<String>(
                value: businessTypes[0], // Dynamically set based on app data
                onChanged: (String? newValue) {},
                decoration: InputDecoration(labelText: 'Business Type'),
                items: businessTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),

              // Tagline (Editable)
              TextFormField(
                controller: taglineController,
                decoration: InputDecoration(labelText: 'Tagline'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tagline is required';
                  }
                  return null;
                },
              ),

              // Brief Description of Gym (Editable)
              TextFormField(
                controller: descriptionController,
                decoration:
                    InputDecoration(labelText: 'Brief Description of Gym'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),

              // Photo Gallery (Upload)
              Text('Photo Gallery'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload Images'),
              ),

              // Video Tour (Upload)
              Text('Video Tour'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload Video'),
              ),

              // Social Media Links (Editable)
              TextFormField(
                controller: socialLinksController,
                decoration: InputDecoration(labelText: 'Social Media Links'),
              ),

              // Trainer Profile Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trainer Profiles'),
                  // Trainer Full Name
                  TextFormField(
                    controller: trainerNameController,
                    decoration: InputDecoration(labelText: 'Trainer Full Name'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Trainer Profile'),
                  ),
                ],
              ),

              // Membership Plan Selection Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Membership Plan'),
                  DropdownButtonFormField<String>(
                    onChanged: (String? newValue) {},
                    decoration: InputDecoration(labelText: 'Choose Plan'),
                    items: [
                      DropdownMenuItem(value: 'Trial', child: Text('Trial')),
                      DropdownMenuItem(
                          value: 'Quarterly', child: Text('Quarterly')),
                      DropdownMenuItem(
                          value: 'Monthly', child: Text('Monthly')),
                    ],
                  ),
                ],
              ),

              // Submit and Save Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save form data
                      }
                    },
                    child: Text('Save as Draft'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Submit form data and create webpage
                      }
                    },
                    child: Text('Create Webpage'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WebPageCreationForm(),
  ));
}
