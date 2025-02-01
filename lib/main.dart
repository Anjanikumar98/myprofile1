import 'package:flutter/material.dart';
import 'package:myprofile1/web_page_creation_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebPageCreationForm(),
    );
  }
}