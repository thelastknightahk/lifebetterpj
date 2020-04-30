import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';
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

class _HomePageState extends State<HomePage> {
  var firstColor = "#74F2CE", secondColor = "#7CFFCB";
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<Widget> siderpage = [
    HealthPage(),
    JobPage(),
    NewsPage(),
    AccessoryPage(),
    PostsPage()
  ];
  int _currentIndex = 0, pageindex = 0;

  var fullWidth, fullHeight;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(1),
        statusBarIconBrightness: Brightness.light));
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);
    return HiddenDrawer(
      drawerWidth: MediaQuery.of(context).size.width * .4,
      drawer: HiddenDrawerMenu(
        menu: <DrawerMenu>[
          DrawerMenu(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Menu 1"),
              ),
              onPressed: () {
                print("Menu 1");
              }),
          DrawerMenu(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Menu 2"),
              ),
              onPressed: () {
                print("Menu 2");
              }),
        ],
      ),
      child: Scaffold(
        key: _drawerKey,
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
                            print("Clicked Menu");
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
                child: siderpage[_currentIndex],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Health'),
              activeColor: Hexcolor(firstColor),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.work),
              title: Text('Jobs'),
              activeColor: Hexcolor(firstColor),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.new_releases),
              title: Text(
                'News ',
              ),
              activeColor: Hexcolor(secondColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
