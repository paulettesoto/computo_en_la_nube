import 'package:flutter/material.dart';
import 'package:mini_proyecto_02/src/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Memorama',
        home: SplashScreen()
    );
  }

}