import 'package:flutter/material.dart';
import 'package:practica_10/src/listview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 09',
      home: ListPage(),
    );
  }
}
