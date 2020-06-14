import 'package:flutter/material.dart';
import 'package:lifebetter/screen/Auth/authen.dart';
import 'package:lifebetter/services/auth/Authenticaion.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(onPressed: () async{
        await _auth.signOut();
      
        print("Clicked Logout from logout.dart");
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AuthenPage()),
  );
      },child: Text("Log Out"),),
    );
  }
}