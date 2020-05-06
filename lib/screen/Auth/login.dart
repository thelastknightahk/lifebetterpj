import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var firstColor = "#14C9CB", secondColor = "#7CFFCB";

  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('95');
  @override
  Widget build(BuildContext context) {
    var fullwidth = MediaQuery.of(context).size.width;
    var fullheight = MediaQuery.of(context).size.height;

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
                Container(
                  child: InkWell(
                    onTap: () {
                      print("CLicked OTp");
                    },
                    child: Text(
                      "OTP",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Enter OTP",
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
            onPressed: () {},
          ),
        ],
      ),
    );
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
