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
  var firstColor = "#14C9CB", secondColor = "#7CFFCB";

  List<Widget> siderpage = [
    HealthPage(),
    JobPage(),
    NewsPage(),
    AccessoryPage(),
    PostsPage()
  ];
  int pageindex = 0;

  var fullWidth, fullHeight;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(1),
        statusBarIconBrightness: Brightness.light));
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);
    return MaterialApp(
          home: HiddenDrawer(
        drawerWidth: MediaQuery.of(context).size.width * .4,
        drawer: HiddenDrawerMenu(
          menu: <DrawerMenu>[
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Health"),
                ),
                onPressed: () {
                  setState(() {
                    pageindex = 0;
                  });
                  print("Clicked Health $pageindex");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Jobs"),
                ),
                onPressed: () {
                  setState(() {
                    pageindex = 1;
                  });
                  print("Clicked Jobs");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("News"),
                ),
                onPressed: () {
                  setState(() {
                    pageindex = 2;
                  });
                  print("Clicked News");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Accessory"),
                ),
                onPressed: () {
                  setState(() {
                    pageindex = 3;
                  });
                  print("Clicked Accesory");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Healthy Posts"),
                ),
                onPressed: () {
                  setState(() {
                    pageindex = 4;
                  });
                  print("Clicked Hposts");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Profile"),
                ),
                onPressed: () {
                  print("Clicked Profile");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Setting"),
                ),
                onPressed: () {
                  print("Clicked Setting");
                }),
          ],
          header: GestureDetector(
            onTap: () => print("Clicked Profile"),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
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
                        image: AssetImage("assets/images/picture.jpg")))),
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Hexcolor(firstColor),
              leading: HiddenDrawerIcon(
                mainIcon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              actions: [
                Container(
                    child: InkWell(
                        onTap: () {
                          print("Noti Clicked");
                           
                        },
                        child: Icon(
                          Icons.notification_important,
                          color: Colors.white,
                        )))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: siderpage[pageindex],
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: pageindex,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeInBack,
              onItemSelected: (index) => setState(() {
                pageindex = index;
                print("$pageindex");
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
                  activeColor: Hexcolor(firstColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}
