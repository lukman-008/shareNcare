import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/books.dart';
import 'package:flutter_application_1/clothes.dart';
import 'package:flutter_application_1/food.dart';
import 'package:flutter_application_1/logeduser.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/money.dart';
import 'package:flutter_application_1/ngo.dart';
import 'package:flutter_application_1/ngodashboard.dart';
import 'package:flutter_svg/flutter_svg.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
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
        elevation: 4.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => help()));
              },
              icon: Icon(
                Icons.lightbulb,
                color: Colors.white,
              ))
        ],
        title: Text("ShareNCare"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(
        child: Column(
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
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Color.fromARGB(255, 0, 0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/snc.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Color.fromARGB(255, 0, 0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/food waste.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Color.fromARGB(255, 0, 0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/donateit.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => help())));
                    },
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Color.fromARGB(255, 0, 0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/book.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8, color: Color.fromARGB(255, 0, 0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/food waste.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 50 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.99,
              ),
            ),
            Expanded(
              child: GridView.count(
                padding:
                    EdgeInsets.only(left: 13, top: 10, bottom: 10, right: 13),
                crossAxisCount: 2,
                childAspectRatio: .85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => personal()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/info.png",
                            scale: 3.5,
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          Text(
                            "ABOUT",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => food()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/food1.png",
                            scale: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "FOOD",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => clothes()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/clothes.png",
                            scale: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "CLOTHES",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => books()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/books.png",
                            scale: 3.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "BOOKS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => money()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/money.jpg",
                            scale: 3.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "MONEY",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ngo()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 172, 172, 172)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/ngos.jpg",
                            scale: 4,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "N.G.Os",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: 450,
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
                        backgroundImage: AssetImage('assets/snc.png'),
                        radius: 55,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email - " + user.email!)
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => help())));
                  },
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => personal())));
                  },
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
                    AuthService().signOut();
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

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset("assets/gg.png"),
          Spacer(),
          Text("DIET COKE")
        ],
      ),
    );
  }
}
