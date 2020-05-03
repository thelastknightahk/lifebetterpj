import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/model/accessmodel.dart';

class AccessoryPage extends StatefulWidget {
  @override
  _AccessoryPageState createState() => _AccessoryPageState();
}

class _AccessoryPageState extends State<AccessoryPage> {
  var fullWidth, fullHeight;

  var firstColor = "#74F2CE",
      secondColor = "#7CFFCB",
      lightGreyColor = "#F8F8F8";
  String dropdownValue = 'Yangon';
  List<AccessoryModel> accList = [
    new AccessoryModel(
        accImg: "assets/images/cake.jpg",
        spName: "Hello Bakery",
        spLocation: "Yangon"),
    new AccessoryModel(
        accImg: "assets/images/shop1.jpg",
        spName: "My Choice",
        spLocation: "Yangon"),
    new AccessoryModel(
        accImg: "assets/images/cake.jpg",
        spName: "Bestices",
        spLocation: "Yangon"),
    new AccessoryModel(
        accImg: "assets/images/eatapple.jpg",
        spName: "Fresh",
        spLocation: "Yangon"),
    new AccessoryModel(
        accImg: "assets/images/cake.jpg",
        spName: "Season",
        spLocation: "Yangon"),
    new AccessoryModel(
        accImg: "assets/images/copywrite.jpeg",
        spName: "My Cont",
        spLocation: "Yangon"),
  ];

  @override
  Widget build(BuildContext context) {
    fullHeight = MediaQuery.of(context).size.height;
    return Column(
      
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Accessories ", style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold, color: Colors.black45),),
            ),
            Container(
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.check),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color:Colors.black),
            underline: Container(
              height: 2,
              color: Hexcolor(secondColor),
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Yangon', 'Manadalay', 'Bago', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
          ],
        ),
        Container(
            height: fullHeight / 1.3,
            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 20.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(accList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    print("Clicked ${accList[index].spName}");
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    elevation: 10.0,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: double.maxFinite,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "${accList[index].accImg}")))),
                          SizedBox(
                            height: 0.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "${accList[index].spName}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "${accList[index].spLocation}",
                              style: TextStyle(color: Colors.black45),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )),
      ],
    );
  }
}
