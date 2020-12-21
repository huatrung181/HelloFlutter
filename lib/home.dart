import 'package:flutter/material.dart';

void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( body: Text("Home page"),
      ),
    );
  }
}


