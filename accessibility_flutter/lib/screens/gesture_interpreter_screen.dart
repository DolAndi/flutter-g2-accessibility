import 'package:flutter/material.dart';

class GestureInterpreter extends StatefulWidget {
  @override
  _GestureInterpreterState createState() => _GestureInterpreterState();
}

class _GestureInterpreterState extends State<GestureInterpreter> {
  String gestureText = 'Nenhum gesto detectado';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interpretação de Gestos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gestureText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Toque ou arraste aqui',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              onTap: () {
                setState(() {
                  gestureText = 'Toque detectado';
                });
              },
              onDoubleTap: () {
                setState(() {
                  gestureText = 'Toque duplo detectado';
                });
              },
              onLongPress: () {
                setState(() {
                  gestureText = 'Pressionamento longo detectado';
                });
              },
              onPanStart: (details) {
                setState(() {
                  gestureText = 'Arraste iniciado';
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  gestureText = 'Arraste em progresso';
                });
              },
              onPanEnd: (details) {
                setState(() {
                  gestureText = 'Arraste finalizado';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
