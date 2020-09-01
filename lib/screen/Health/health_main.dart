import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/model/NoInternet/ErrorHelper.dart';
import 'package:lifebetter/provider/dataProvider.dart';
import 'package:lifebetter/provider/getall.dart';
import 'package:lifebetter/screen/Health/healthdetail.dart';
import 'package:lifebetter/screen/Loader/circularLoader3.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> with AfterLayoutMixin {
  var fullWidth, fullHeight;
  var firstColor = "#1BD7BB",
      secondColor = "#14C9CB",
      lightGreyColor = "#F8F8F8";
  final provider = getIt<DataProvider>();
  final scrollDirection = Axis.vertical;
  List<dynamic> healthdata = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    final response = await http.get(
        "http://gsx2json.com/api?id=14TGwS0ew-nXyES5TdpjLtNDlnBiC_8wEB9Hz0yJd9kQ&sheet=1");
    List<dynamic> data;
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      data = map["rows"];
      healthdata = data;
    } else {
      throw Exception('Failed to load photos');
    }
    return healthdata;
  }

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: fullHeight / 6,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  left: fullWidth / 5,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Hexcolor(firstColor),
                              Hexcolor(secondColor)
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0),
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(3.0),
                          bottomLeft: Radius.circular(15.0),
                        )),
                    width: fullWidth / 1.5,
                    height: fullHeight / 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "02",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Level",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "25/4/20",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Date",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "35'C",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Temperature",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          _healthListView(context),
        ],
      ),
    );
  }

  Widget _healthListView(BuildContext context) {
    return FutureBuilder(
      future: _fetchData(),
      builder: (context, snapshot) {
        healthdata = snapshot.data;
        if (healthdata == null) {
          return ColorLoader3(
            dotRadius: 10.0,
          );
        }
        return Container(
          height: fullHeight / 1.66,
          child: ListView.builder(
              scrollDirection: scrollDirection,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthDetail(
                                detailData: healthdata,
                                index: index,
                              )),
                    );
                  },
                  child: Card(
                      color: Hexcolor(lightGreyColor),
                      elevation: 10.0,
                      child: Container(
                        height: 60.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: Hexcolor(secondColor),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                  child: Text(
                                "$index",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Hexcolor(lightGreyColor),
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Hello",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "${healthdata[index]['description']}",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 30.0,
                              child: Image(
                                  image: AssetImage("assets/images/play.png")),
                            )
                          ],
                        ),
                      )),
                );
              }),
        );
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    provider.getHealth();
    provider.healthDataStream.listen((snp) {
      snp.fold((l) {
        print("Something went wrong $l");
        if (l is ErrorHelper) {
          print("Unable to connect ");
        }
      }, (r) {
        print("Data Length ${r.length}");
      });
      setState(() {
        print("Aung Htet Kyaw is Successfull");
      });
    });
  }
}
