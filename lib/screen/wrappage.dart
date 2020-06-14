import 'package:flutter/material.dart';
import 'package:lifebetter/screen/Auth/authen.dart';
import 'package:lifebetter/screen/home.dart';
import 'package:lifebetter/utils/user.dart';
import 'package:provider/provider.dart';


class WrapPage extends StatefulWidget {
  final String exituser;

  const WrapPage({Key key, this.exituser}) : super(key: key);
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
   
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<UserData>(context);
   
     if(user == null && widget.exituser!= "yes"){
       print("${widget.exituser}");
       return AuthenPage();
     }
     else{
       return HomePage();
     }
  }
   
}