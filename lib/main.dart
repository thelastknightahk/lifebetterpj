import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:lifebetter/screen/splashscreen.dart';


import 'package:lifebetter/services/auth/Authenticaion.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firstColor = "#7CFFCB";
    return StreamProvider.value(
         value: AuthService().userLogindata,
          child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DrawerMenuState(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Hexcolor(firstColor),
          ),
          home: SplashScreen(),//SplashScreen
        ),
      ),
    );
  }
}
