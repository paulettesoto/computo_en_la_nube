import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Atras')
            ),
          ],
        ),
      ),
    );
  }
}