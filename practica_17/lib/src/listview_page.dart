import 'package:flutter/material.dart';
import 'package:practica_17/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          return Slidable(
            key: ValueKey(item['id']),
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Agregar',
                  backgroundColor: Colors.green,
                  icon: Icons.library_add,
                  onPressed: (context) => onDimissed(index, 'Agregar'),
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Eliminar',
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  onPressed: (context) => onDimissed(index, 'Eliminar'),
                ),
              ],
            ),
            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['Genres']),
            ),
          );
        },
      ),
    );
  }

  onDimissed(int index, String accion) {
    setState(() {
      final _snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);

      switch (accion) {
        case 'Agregar':
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
      }
    });
  }
}
