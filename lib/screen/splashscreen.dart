import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifebetter/screen/wrappage.dart';
import 'package:lifebetter/utils/datacenter.dart';
import 'package:lifebetter/utils/userpreference.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var fullWidth, fullHeight;
  String s = "";
  final userpreference = UserPreference();
  @override
  void initState() {
    super.initState();
    
   
    startTime();
    getData();
  }
  
  
  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        width: fullWidth, height: fullHeight, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150.w,
              height: 150.h,
              child: Image.asset("assets/images/logo3.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Splash Screen",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    print(s + " From Splash Screen");
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => WrapPage(exituser: s)));
  }

  Future<void> getData() async {
    String us = await userpreference.getStringValuesSF();
    s += us;
    print("$s");
  }
}
