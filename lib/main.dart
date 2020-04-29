import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    var firstColor = "#7CFFCB";
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Hexcolor(firstColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
