import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(AccessibilityApp());
}

class AccessibilityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessibility App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
