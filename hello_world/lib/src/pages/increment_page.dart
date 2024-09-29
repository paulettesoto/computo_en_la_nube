import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _IncrementPageState();
  }
}

class _IncrementPageState extends State<IncrementPage>{
  int _conteo = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi primer APP en Flutter'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Numero de Click', style: TextStyle(fontSize: 25)),
              Text('$_conteo', style: TextStyle(fontSize: 30, color: Colors.red))
            ],
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (_conteo > 0) {
                  _conteo--;
                }
              });
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _conteo++;
              });
            },
          ),
        ],
      ),
    );
  }
}