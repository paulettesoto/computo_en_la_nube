import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrlpeso = new TextEditingController();
  final ctrlestatura = new TextEditingController();
  final data = Data(peso: 0, estatura: 0);
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('IMC'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlpeso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa tu peso',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            TextField(
              controller: ctrlestatura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa tu estatura',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    foregroundColor: Colors.white
                ),
                child: Text('Calcular'),
                onPressed: () {
                  setState(() {
                    data.peso = double.parse(ctrlpeso.text);

                    data.estatura = double.parse(ctrlestatura.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DatosPage(data: data)));
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  double peso;
  double estatura;

  Data({required this.peso, required this.estatura});
}