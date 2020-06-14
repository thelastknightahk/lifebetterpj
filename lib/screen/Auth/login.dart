import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

import 'package:lifebetter/utils/offdata.dart';
import 'package:lifebetter/screen/home.dart';
import 'package:lifebetter/utils/userpreference.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var firstColor = "#14C9CB", secondColor = "#7CFFCB";
  var phoneNumber, userPass;
  String exitApp;
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('95');
  final databaseReference = Firestore.instance;
  final userpreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    var fullwidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        // shrinkWrap: true,
        // padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: InkWell(
                      onTap: () {
                        _openCountryPickerDialog();
                      },
                      child: _buildDialogItem(_selectedDialogCountry)),
                ),
                Container(
                  width: fullwidth / 2,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      phoneNumber = OffData.phCode + val;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: "Enter Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                userPass = val;
              },
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Enter Password",
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text("Login"),
            onPressed: () async {
              await getFirebaseData();
            },
          ),
        ],
      ),
    );
  }

  Future getFirebaseData() async {
    var dref = databaseReference.collection("users").document(phoneNumber);
    dref.get().then((documentSnapshot) {
      var pass = userPass;
      if (pass == "${documentSnapshot.data['Password']}") {
         userpreference.addStringToSF();
        print(
            "Hello ${documentSnapshot.data['Password']} Name  ${documentSnapshot.data['UserName']} Phno ${documentSnapshot.data['PhoneNo']}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print("Something Went Wroung");
      }

      // check and do something with the data here.
    });
    
  }
   
  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
          ),
        ),
      );
}

Widget _buildDialogItem(Country country) => Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        //SizedBox(width: 8.0),
        //Flexible(child: Text(country.name))
      ],
    );
