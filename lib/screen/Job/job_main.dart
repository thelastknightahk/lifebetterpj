import 'package:flutter/material.dart';

import 'package:lifebetter/model/businessmodel.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  var fullWidth, fullHeight;
  var firstColor = "#74F2CE",
      secondColor = "#7CFFCB",
      lightGreyColor = "#F8F8F8";

  List<BusinessModel> hbJobs = [
    new BusinessModel("Handmade", "assets/images/handmade.jpg"),
    new BusinessModel("Cake Institute", "assets/images/cake.jpg"),
    new BusinessModel("copy Write", "assets/images/copywrite.jpeg"),
    new BusinessModel("Delivery", "assets/images/deliver.png"),
    new BusinessModel("web Design", "assets/images/webdesign.jpg"),
    new BusinessModel("Android Developer", "assets/images/android.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: fullWidth,
              height: fullHeight / 3.9,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0)),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/homebusiness5.gif")))),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Text(
              "Home Based Business",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.all(5.0),
              height: fullHeight / 2,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(hbJobs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      print("Clicked ${hbJobs[index].businessName}");
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${hbJobs[index].businessImage}"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        child: Center(
                            child: Text(
                          "${hbJobs[index].businessName}",
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  );
                }),
              )
              )
        ],
      ),
    );
  }
}
