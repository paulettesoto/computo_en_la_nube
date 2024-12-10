import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practica_19/src/pdf_preview.dart';
import 'package:practica_19/ui/details_container.dart';
import 'package:practica_19/ui/head_container.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  String? datosImage;
  String? _path;

  DetailsPage({
    this.datosName,
    this.datosGender,
    this.datosImage
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosName + ' Details'),
        backgroundColor: Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0
      ),
      body: Container(
        color: Color(0xFF272A3C),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailContainer(nom: datosName, sexo: datosGender)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF422C),
        child: Icon(Icons.print_outlined),
        onPressed: () {
          _downloadImage();
          Future.delayed(
            Duration(milliseconds: 3000),
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfPage(
                    nombre: datosName,
                    genero: datosGender,
                    imagenurl: _path
                  )
                )
              )
          );
        },
      ),
    );
  }

  _downloadImage() async {
    try {
      if (datosImage != null) {
        final response = await Dio().get(
          datosImage!,
          options: Options(responseType: ResponseType.bytes),
        );

        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/${datosName}_image.png';

        File file = File(filePath);
        await file.writeAsBytes(response.data);

        _path = filePath;
      }
    } catch (error) {
      print(error);
    }
  }
}