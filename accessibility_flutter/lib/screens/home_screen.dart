import 'package:flutter/material.dart';
import 'voice_search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _textScaleFactor = 1.0;
  bool _highContrastEnabled = false;

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

  void _toggleHighContrast() {
    setState(() {
      _highContrastEnabled = !_highContrastEnabled;
    });
  }

  void _navigateToVoiceSearchScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VoiceSearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de acessibilidade',
      theme: _highContrastEnabled ? _buildHighContrastTheme() : _buildTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('App de Acessibilidade'),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: _textScaleFactor,
                  ),
                  child: Text(
                    'Bem vindo ao app de acessibilidade',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Opções de Acessibilidade',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          leading: Icon(Icons.add_circle),
                          title: Text('Aumentar Tamanho do Texto'),
                          onTap: _increaseTextSize,
                        ),
                        ListTile(
                          leading: Icon(Icons.remove_circle),
                          title: Text('Diminuir Tamanho do Texto'),
                          onTap: _decreaseTextSize,
                        ),
                        ListTile(
                          leading: Icon(Icons.color_lens),
                          title: Text('Ajuste de Contrastes'),
                          onTap: _toggleHighContrast,
                        ),
                        // Adicione mais opções de acessibilidade aqui
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: Icon(Icons.mic),
                      title: Text('Pesquisar por Voz'),
                      onTap: _navigateToVoiceSearchScreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.settings),
          onPressed: () {
            // Abra um menu com mais configurações
          },
        ),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }

  ThemeData _buildHighContrastTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.yellow,
      accentColor: Colors.black,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      fontFamily: 'Arial',
    );
  }
}

void main() {
  runApp(HomeScreen());
}
