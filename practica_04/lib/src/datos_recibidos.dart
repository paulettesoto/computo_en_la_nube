import 'package:flutter/material.dart';
import 'package:practica_04/src/home_page.dart';


class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[200],
        title: Text('Datos Recibidos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Los datos son:'),
            Text('Nombre: ${data.nombre}'),
            Text('Sexo: ${data.sexo}')
          ],
        ),
      ),
    );
  }
}