import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonDetails extends StatefulWidget {
  final String name;
  final String url;

  const PokemonDetails({super.key, required this.name, required this.url});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  Map<String, dynamic>? pokemonData;

  @override
  void initState() {
    super.initState();
    _fetchPokemonData();
  }

  Future<void> _fetchPokemonData() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          pokemonData = data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    }catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: pokemonData == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          children: [
            Text(
              widget.name.toUpperCase(),
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            pokemonData!['sprites'] !=null
                ? Image.network(
                pokemonData!['sprites']['front_default'])
                : Container(),
            const SizedBox(height: 20),
            Text('Altura: ${pokemonData!['height']}', style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 20),
            Text('Weight: ${pokemonData!['weight']}', style: const TextStyle(fontSize: 16),),
          ],
        ) ,
      ),
    );
  }
}