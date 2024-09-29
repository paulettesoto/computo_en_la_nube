import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/home_page.dart';


class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({required this.data});

  double calcularIMC() {
    return data.peso / (data.estatura * data.estatura);
  }



  String obtenerClasificacion(double imc) {
    if (imc < 18) {
      return 'Peso Bajo. Necesario valorar signos de desnutrición';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'Normal';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'Obesidad';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'Obesidad grado I. Riesgo relativo para desarrollar enfermedades cardiovasculares';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'Obesidad grado II. Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
    } else {
      return 'Obesidad grado III (Extrema o mórbida). Riesgo relativo extremadamente alto para el desarrollo de enfermedades';
    }
  }

  String obtenerImagen(double imc) {
    if (imc < 18) {
      return 'assets/peso_bajo.png';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'assets/normal.png';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'assets/obesidad.png';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'assets/obesidad_1.png';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'assets/obesidad_2.png';
    } else {
      return 'assets/obesidad_3.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    double imc = calcularIMC();
    String clasificacion = obtenerClasificacion(imc);
    String imagen = obtenerImagen(imc);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[200],
        title: Text('Resultado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('IMC: ${imc.toStringAsFixed(2)}'),
            Text('$clasificacion'),
            SizedBox(height: 20),
            Image.asset(imagen),
          ],
        ),
      ),
    );
  }
}