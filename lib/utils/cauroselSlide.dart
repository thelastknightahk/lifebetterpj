import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lifebetter/services/news/newsdata.dart';

class MyCauroselSlide extends StatefulWidget {
  @override
  _MyCauroselSlideState createState() => _MyCauroselSlideState();
}

class _MyCauroselSlideState extends State<MyCauroselSlide> {
  List<NewsData> mydata = [];

  int current = 0;
  var fullwidth, fullheight;
  @override
  Widget build(BuildContext context) {
    fullwidth = MediaQuery.of(context).size.width;
    fullheight = MediaQuery.of(context).size.height;
    if (NewsData.healthPost.length > 0) {
      mydata.addAll(NewsData.healthPost);
    }
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
            return Container(
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
                              image: AssetImage("${mydata[current].newImage}"),
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
                ));
          },
        );
      }).toList(),
    );
  }
}
