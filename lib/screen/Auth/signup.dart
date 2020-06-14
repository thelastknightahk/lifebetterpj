import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:lifebetter/services/auth/Authenticaion.dart';
import 'package:lifebetter/utils/offdata.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('95');
  final _auth = AuthService();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var fullwidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Form(
        key: _key,
        child: Column(
          // shrinkWrap: true,
          // padding: const EdgeInsets.all(16.0),

          // shrinkWrap: true,
          // padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: 80.0,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (val) {
                  OffData.userName = val;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter User Name",
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
              ),
            ),
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
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          v.isEmpty ? 'Enter Valid Phone Number ' : null,
                      onChanged: (val) {
                        OffData.phNo = val; // Assign OffData Ph No
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
            RaisedButton(
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text("Sign Up"),
              onPressed: () async {
                print(
                    "${OffData.userPhoneNoDetail} ${OffData.userName} ${OffData.countryName}"); //add data to store

                Firestore.instance
                    .collection("users")
                    .document(OffData.userPhoneNoDetail)
                    .get()
                    .then((DocumentSnapshot ds) => {
                          if (ds.exists)
                            {print("Sorry You have been registered")}
                          else
                            {_auth.signInWithPhoneNumber(context)}
                        });
              },
            ),
          ],
        ),
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
            onValuePicked: (Country country) => setState(() {
              _selectedDialogCountry = country;
              OffData.phCode = "+" +
                  _selectedDialogCountry.phoneCode; //Assign OffData to phcode
              OffData.countryName =
                  _selectedDialogCountry.name; //Assign OffData to country Name
            }),
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
        // Flexible(child: Text(country.name))
      ],
    );
