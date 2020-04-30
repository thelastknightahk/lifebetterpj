import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/screen/home.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firstColor = "#7CFFCB";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrawerMenuState(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Hexcolor(firstColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
