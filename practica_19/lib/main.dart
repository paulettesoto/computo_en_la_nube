import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_19/src/listview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Practica 19',
        home: ListViewPage()
    );
  }
}
