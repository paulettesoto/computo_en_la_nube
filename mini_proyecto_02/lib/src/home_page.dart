import 'package:flutter/material.dart';
import 'package:mini_proyecto_02/src/memorama_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Memorama'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selecciona el tamaño de pares',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            _buildLevelButton(context, 16),
            _buildLevelButton(context, 20),
            _buildLevelButton(context, 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, int numPairs) {
    int numPairsDivided = numPairs ~/ 2;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemoramaPage(numPairs: numPairs),
          ),
        );
      },
      child: Text('$numPairsDivided pares'),
    );
  }
}
