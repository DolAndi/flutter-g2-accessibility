import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _textScaleFactor = 1.0;

  void _increaseTextSize() {
    setState(() {
      _textScaleFactor += 0.1;
    });
  }

  void _decreaseTextSize() {
    setState(() {
      if (_textScaleFactor > 0.1) {
        _textScaleFactor -= 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Acessibilidade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: _textScaleFactor,
              ),
              child: Text(
                'Bem vindo ao app de acessibilidade',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Semantics(
                  label: 'Decrease Text Size Button',
                  hint: 'Double tap to decrease text size',
                  button: true,
                  onTapHint: 'Double tap to decrease text size',
                  child: GestureDetector(
                    onTap: _decreaseTextSize,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Semantics(
                  label: 'Increase Text Size Button',
                  hint: 'Double tap to increase text size',
                  button: true,
                  onTapHint: 'Double tap to increase text size',
                  child: GestureDetector(
                    onTap: _increaseTextSize,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccessibilityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de acessibilidade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(AccessibilityApp());
}
