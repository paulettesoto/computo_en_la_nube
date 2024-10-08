import 'package:flutter/material.dart';
import 'package:practica_13/src/pokemon_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material app',
        home: PokemonList(),
    );
  }
}