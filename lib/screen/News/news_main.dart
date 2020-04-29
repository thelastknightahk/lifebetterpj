import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/services/news/newsdata.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var fullWidth, fullHeight;
  List<NewsData> mydata = [];
  var firstColor = "#74F2CE",
      secondColor = "#7CFFCB",
      lightGreyColor = "#F8F8F8";
  int current = 0;
  var fullwidth, fullheight;
  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    if (NewsData.healthPost.length > 0 && mydata.length == 0) {
      mydata.addAll(NewsData.healthPost);
    }
    return Container(
      child: Column(
        children: [
          Container(
            width: fullWidth,
            height: fullHeight / 3.5,
            child: myCaurosel(context),
          ),
          Container(
            height: fullHeight / 2,
            color: Hexcolor("#F8F8F8"),
            child: ListView.builder(
                itemCount: mydata.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Clicked ${mydata[index].title}");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      elevation: 8.0,
                      child: Container(
                        height: ScreenUtil().setHeight(400.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${mydata[index].title}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "${mydata[index].title}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: ScreenUtil().setWidth(300.0),
                                height: ScreenUtil().setHeight(300.0),
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "${mydata[index].newImage}")))),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget myCaurosel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            current = index;
          });
        },
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: mydata.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                print("Clicked ${mydata[current].title}");
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10.0))),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                                image:
                                    AssetImage("${mydata[current].newImage}"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        child: Text(
                          mydata[current].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.0,
                              backgroundColor: Colors.black45),
                        ),
                        alignment: FractionalOffset.bottomCenter,
                        padding: EdgeInsets.only(bottom: 10.0),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
