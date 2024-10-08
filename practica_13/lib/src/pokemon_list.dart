import 'package:flutter/material.dart';
import 'package:practica_13/src/pokemon_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState () => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 13'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: _llamarUrl(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            try {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext coontext, int index) {
                    var datos = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/b/b1/Pok%C3%A9ball.png')
                      ),
                      trailing: Icon(Icons.arrow_right),
                      title: Text(datos['name'].toString().toUpperCase()),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                PokemonDetails(
                                    name: datos['name'], url: datos['url'])));
                      },
                    );
                  });
            } catch (exc) {
              return const Center(child: CircularProgressIndicator());
            }
          })
        );
  }
  Future<List<dynamic>> _llamarUrl() async {
    try {
      var url = "https://pokeapi.co/api/v2/pokemon?limit=30";
      final respuesta = await http.get(Uri.parse(url));

      if (respuesta.statusCode == 200) {
        final _respuestajson = json.decode(respuesta.body);
        return _respuestajson['results'];
      } else {
        throw Exception('Error al obtener los datos');
      }
    } catch (exc) {
      print(exc);
      rethrow;
    }
  }

}