import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late final PageController pageController;
  int pageno = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TechPath"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/techlogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/cheap.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/carr.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => homepage())));
                  },
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/code.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/exp.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 50 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.99,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: SizedBox(
          height: 300,
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/bg1.jpg'),
                        radius: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("lukmanmohammad008@gmail.com")
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text("Profile"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.feedback,
                    color: Colors.white,
                  ),
                  title: Text("Feedback"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text("Help Desk"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.account_balance_outlined,
                    color: Colors.white,
                  ),
                  title: Text("About"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)])),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => homepage())));
                  },
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  title: Text("Logout"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
