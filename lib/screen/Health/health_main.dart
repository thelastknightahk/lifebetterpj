import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  var fullWidth, fullHeight;
  var firstColor = "#74F2CE",
      secondColor = "#7CFFCB",
      lightGreyColor = "#F8F8F8";

  AutoScrollController controller;
  final scrollDirection = Axis.vertical;
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    _scrollToIndex();
  }

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: fullHeight / 3.8,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: fullHeight / 5.5,
                    width: fullWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45.0),
                            bottomRight: Radius.circular(5.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Hexcolor(firstColor),
                              Hexcolor(secondColor)
                            ])),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: ScreenUtil().setHeight(50.0)),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => print("Clicked Profile"),
                            child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/picture.jpg")))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: fullHeight / 7.9,
                  left: fullWidth / 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Hexcolor(lightGreyColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
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
                              ),
                              Text("Level")
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text("25/4/20"), Text("Date")],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text("35'C"), Text("Temperature")],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: fullHeight / 1.9,
            child: ListView.builder(
                scrollDirection: scrollDirection,
                controller: controller,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 55,
                itemBuilder: (context, index) {
                  return _wrapScrollTag(
                    index: index,
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
                                      "FirstDay Of Excercise",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "let do it",
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
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  int counter = 0;
  Future _scrollToIndex() async {
    setState(() {
      counter = 5;
    });

    await controller.scrollToIndex(5, preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}
