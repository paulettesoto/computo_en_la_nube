import 'package:flutter/material.dart';
import 'package:practica_15/src/slivers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SliversPage(),
    );
  }
}