import 'package:flutter/material.dart';

class HealthDetail extends StatelessWidget {
  List<dynamic> detailData;int index;
  HealthDetail({this.detailData, this.index});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("${detailData[index]['step']}"),
        ),
      ),
    );
  }
}