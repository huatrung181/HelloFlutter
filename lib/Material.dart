import 'package:flutter/material.dart';

void main(){
  runApp(MaterialExample());
}

class MaterialExample extends StatefulWidget {
  @override
  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),

      home: Scaffold(
        appBar: AppBar(title: Text("MyApp"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120, height: 120, color: Colors.greenAccent,
              ),
              Container(
                width: 100, height: 100, color: Colors.yellowAccent,
              ),
              Container(
                width: 80, height: 80, color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
