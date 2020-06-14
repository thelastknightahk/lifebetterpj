import 'package:flutter/material.dart';

class JobItem extends StatefulWidget {
  final data;

  const JobItem({Key key, this.data}) : super(key: key);

  @override
  _JobItemState createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Job  "+widget.data),
        ),
      ),
    );
  }
}