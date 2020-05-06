import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/screen/Auth/login.dart';
import 'package:lifebetter/screen/Auth/signup.dart';

class AuthThreePage extends StatefulWidget {
  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}

class _AuthThreePageState extends State<AuthThreePage> {
  var firstColor = "#14C9CB", secondColor = "#7CFFCB", lightgrey = "#F8F8F8";
  bool formVisible;
  int _formsIndex;
  var fullwidth, fullheight;
  @override
  void initState() {
    super.initState();
    formVisible = true;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    fullwidth = MediaQuery.of(context).size.width;
    fullheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight + 10),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/images/logo3.png")))),
                      Text(
                        "Life Better",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Ebit',
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Get Your Opportunities",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontFamily: 'Ebit'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                          width: fullwidth / 1.5,
                          height: fullheight / 3,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/mverify.gif")))),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Login"),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Hexcolor(lightgrey),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 2;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
                const SizedBox(height: 40.0),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: (!formVisible)
                ? null
                : Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              textColor: _formsIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              color: _formsIndex == 1
                                  ? Colors.lightBlueAccent
                                  : Colors.white,
                              child: Text("Login"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RaisedButton(
                              textColor: _formsIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              color: _formsIndex == 2
                                  ? Colors.lightBlueAccent
                                  : Colors.white,
                              child: Text("Signup"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 2;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  formVisible = false;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                                _formsIndex == 1 ? LoginForm() : SignupForm(),
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}
