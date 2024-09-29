import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> _clasesPokemon = [
    'Normal',
    'Fighting',
    'Flying',
    'Poison',
    'Ground'
    'Rock',
    'Bug',
    'Ghost',
    'Steel',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Psychic',
    'Ice',
    'Dragon',
    'Dark',
    'Fairy',
    'Unknown',
    'Shadow',
    '-------'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 10 - Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: _clasesPokemon.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Text('${_clasesPokemon[index]}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://www.clipartmax.com/png/middle/129-1298536_pokeball-free-icon-pokeball-icon.png'),
              radius: 16.0,
            ),
            trailing: Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}