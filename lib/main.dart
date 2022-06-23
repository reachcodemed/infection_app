import 'package:flutter/material.dart';
import 'main_pages/opening_page.dart';

void main() {
  runApp(const InfectionApp());
}

class InfectionApp extends StatelessWidget {
  const InfectionApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OpeningPage(),
    );
  }
}

