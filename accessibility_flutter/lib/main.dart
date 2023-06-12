import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/gesture_interpreter_screen.dart';

void main() => runApp(AccessibilityApp());

class AccessibilityApp extends StatefulWidget {
  @override
  _AccessibilityAppState createState() => _AccessibilityAppState();
}

class _AccessibilityAppState extends State<AccessibilityApp> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    GestureInterpreter(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accessibility App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gesture),
              label: 'Gesture',
            ),
          ],
        ),
      ),
    );
  }
}
