import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lifebetter/screen/Accessory/accessory_main.dart';
import 'package:lifebetter/screen/Health/health_main.dart';
import 'package:lifebetter/screen/Job/job_main.dart';
import 'package:lifebetter/screen/News/news_main.dart';
import 'package:lifebetter/screen/Posts/posts_main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  
  var firstColor = "#74F2CE", secondColor = "#7CFFCB";
  List<Widget> siderpage = [
    HealthPage(),
    JobPage(),
    NewsPage(),
    AccessoryPage(),
    PostsPage()
  ];
  int _currentIndex = 0, pageindex = 0;
  TabController tabBarController;
  FancyDrawerController _controller;
  var fullWidth, fullHeight;
  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  

  @override
  void dispose() {
    _controller.dispose();
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(1),
        statusBarIconBrightness: Brightness.light));
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
          GestureDetector(
            
            onTap: () {
              pageindex = 0;
            
              print("Got Health");
            },
            child: Text(
              "Health",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageindex = 1;

              print("Got Job");
            },
            child: Text(
              "Home Based Business",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageindex = 2;
              print("Got News");
            },
            child: Text(
              "Health News",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageindex = 3;
              print("Got Accessory");
            },
            child: Text(
              "Accessories",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageindex = 4;
              print("Got Posts");
            },
            child: Text(
              "Healthy Status",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Log out",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                        Hexcolor(firstColor),
                        Hexcolor(secondColor)
                      ])),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(60),
                      left: ScreenUtil().setWidth(40),
                      right: ScreenUtil().setWidth(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _controller.toggle();
                            }),
                        IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.notifications_active),
                            onPressed: () {
                              print("Clicked Noti");
                            }),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: siderpage[pageindex],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _onTapped,
            currentIndex:
                _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: new Icon(
                    Icons.home,
                  ),
                ),
                title: new Text('Health'),
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: new Icon(Icons.work),
                ),
                title: new Text('Jobs'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.data_usage), title: Text('News'))
            ],
          ),
        ),
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageindex = _currentIndex;
      print("$_currentIndex");
    });
  }
}
