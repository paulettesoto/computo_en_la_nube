import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_proyecto_02/src/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoramaPage extends StatefulWidget {
  final int numPairs;

  MemoramaPage({required this.numPairs});

  @override
  _MemoramaPageState createState() => _MemoramaPageState();
}

class _MemoramaPageState extends State<MemoramaPage> {
  late Timer _timer;
  int _seconds = 0;
  bool _gameOver = false;
  late List<String> _images;
  late List<bool> _revealed;
  late List<bool> _matched;
  int _firstCardIndex = -1;
  int _secondCardIndex = -1;
  bool _isCheckingPair = false;
  int _record = 0;

  @override
  void initState() {
    super.initState();
    _startGame();
    _loadRecord();
  }

  void _startGame() {
    _images = _generateImageList();
    _revealed = List.generate(widget.numPairs, (_) => false);
    _matched = List.generate(widget.numPairs , (_) => false);
    _seconds = 0;
    _gameOver = false;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_gameOver) {
        timer.cancel();
      } else {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  Future<void> _loadRecord() async {
    int? record = await RecordManager.getRecord(widget.numPairs);
    setState(() {
      _record = record ?? 0;
    });
  }

  List<String> _generateImageList() {
    List<String> baseImages = [
      'circulo.png', 'cono.png', 'cuadrado.png', 'dodecaedro.png', 'estrella.png', 'hexagonal.png', 'octaedro.png', 'octagono.png', 'pentagono.png', 'rectangulo.png', 'rombo.png', 'triangulo.png'
    ];

    List<String> selectedImages;
    if (widget.numPairs == 16) {
      selectedImages = baseImages.sublist(0, 8);
    } else if (widget.numPairs == 20) {
      selectedImages = baseImages.sublist(0, 10);
    } else if (widget.numPairs == 24) {
      selectedImages = baseImages.sublist(0, 12);
    } else {
      selectedImages = [];
    }

    List<String> imagePairs = [...selectedImages, ...selectedImages]..shuffle();
    return imagePairs;
  }
  void _resetSelections() {
    _firstCardIndex = -1;
    _secondCardIndex = -1;
    _isCheckingPair = false;
  }

  void _onCardTap(int index) {
    if (_isCheckingPair || _revealed[index] || _matched[index]) {
      return;
    }

    setState(() {
      _revealed[index] = true;
    });

    if (_firstCardIndex == -1) {
      _firstCardIndex = index;
    } else if (_secondCardIndex == -1) {
      _secondCardIndex = index;
      _isCheckingPair = true;

      if (_images[_firstCardIndex] == _images[_secondCardIndex]) {
        print('Pareja encontrada: $_firstCardIndex y $_secondCardIndex');
        setState(() {
          _matched[_firstCardIndex] = true;
          _matched[_secondCardIndex] = true;
        });

        _resetSelections();

        Future.microtask(() {
          _checkGameOver();
        });
      } else {
        print('Pareja no encontrada: $_firstCardIndex y $_secondCardIndex');
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _revealed[_firstCardIndex] = false;
            _revealed[_secondCardIndex] = false;
          });
          _resetSelections();
        });
      }
    }
  }


  void _checkGameOver() {
    if (_matched.every((element) => element)) {
      setState(() {
        _gameOver = true;
      });
      _timer.cancel();
      RecordManager.saveRecord(widget.numPairs, _seconds);
      _loadRecord();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Memorama'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Tiempo: $_seconds segundos',
            style: TextStyle(fontSize: 24),
          ),
          if (_record > 0)
            Text(
              'Record actual: $_record segundos',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          Expanded(
            child: GridView.builder(
              itemCount: _images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return CardWidget(
                  imagePath: _images[index],
                  revealed: _revealed[index] || _matched[index],
                  onTap: () {
                    _onCardTap(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class RecordManager {
  static Future<void> saveRecord(int numPairs, int time) async {
    final prefs = await SharedPreferences.getInstance();
    int? currentRecord = prefs.getInt('record_$numPairs');
    if (currentRecord == null || time < currentRecord) {
      await prefs.setInt('record_$numPairs', time);
    }
  }
  static Future<int> getRecord(int numPairs) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('record_$numPairs') ?? 0;
  }


}
