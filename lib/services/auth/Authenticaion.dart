import 'package:easy_dialog/easy_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifebetter/screen/home.dart';
import 'package:lifebetter/services/userdata/userinfo.dart';

import 'package:lifebetter/utils/user.dart';
import 'package:lifebetter/utils/offdata.dart';

class AuthService {
  String _codeSent = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserData _firebaseUser(FirebaseUser user) {
    return user != null ? UserData(userId: user.uid) : null;
  }

  Stream<UserData> get userLogindata {
    return _auth.onAuthStateChanged.map(_firebaseUser);
  }

  //Sign In with Phone Number
  Future signInWithPhoneNumber(BuildContext _context) async {
    try {
      String phoneNumber = OffData.userPhoneNoDetail;
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential crendential) async {
            AuthResult result = await _auth.signInWithCredential(crendential);
            FirebaseUser user = result.user;
            print(user.uid);
          },
          verificationFailed: (e) {
            print(e.message + "hello");
          },
          codeSent: (String verificationid, [int forceResendingToken]) {
            showDialog(
                context: _context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(60.0),
                    title: Text("Verify OTP"),
                    content: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) => _codeSent = val,
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          AuthCredential credential =
                              PhoneAuthProvider.getCredential(
                                  verificationId: verificationid,
                                  smsCode: _codeSent);
                          AuthResult result =
                              await _auth.signInWithCredential(credential);
                          FirebaseUser user = result.user;
                           
                          _customRateEasyDialog(context);
                          
                          print("AuthService Phone Number is Successful" +
                              user.uid);
                        },
                        child: Text("Confirm"),
                        textColor: Colors.white,
                        color: Colors.blue,
                      )
                    ],
                  );
                });
          },
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      print(e.toString() + "usererr");
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void _customRateEasyDialog(BuildContext context) {
    EasyDialog(
        cornerRadius: 15.0,
        fogOpacity: 0.1,
        width: 280,
        height: 180,
        contentPadding:
            EdgeInsets.only(top: 12.0), // Needed for the button design
        contentList: [
          Expanded(flex: 1, child: Text("Assign Password")),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  
                  onChanged: (val){
                    OffData.password = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                  ),
                ),
              )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            child: FlatButton(
              onPressed: () async{
                 await UserInfoData().upLoadUserData(OffData.userName , OffData.userPhoneNoDetail, OffData.countryName , OffData.password);
                print("Set");
                // Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                "Set Password",
                textScaleFactor: 1.3,
              ),
            ),
          ),
        ]).show(context);
  }
}
