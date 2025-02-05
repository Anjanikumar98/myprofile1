import 'package:flutter/material.dart';
import 'package:myprofile1/web_page_creation_form.dart';

import 'Components/local_components/business_name.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1A1A1A),
      ),
      home: Scaffold(
        body: SafeArea(
          child: WebPageFormScreen()
        ),
      ),
    );
  }
}
