import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IMC',
        home: SplashScreen()
    );
  }

}