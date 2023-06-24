import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ngoLogin.dart';
import 'package:flutter_application_1/userlogin.dart';
import 'package:lottie/lottie.dart';

class loggeduser extends StatefulWidget {
  const loggeduser({super.key});

  @override
  State<loggeduser> createState() => _loggeduserState();
}

class _loggeduserState extends State<loggeduser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/new.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 253, 254, 255),
                Color.fromARGB(255, 35, 3, 193),
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 20),
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: 400,
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/private_files/lf30_1TcivY.json"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Color.fromARGB(255, 3, 54, 96)
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homepage()));
                      },
                      hoverColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(22, 10, 22, 10),
                      child: Text(
                        "LogIn As User",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Color.fromARGB(255, 3, 54, 96)
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ngoLogin()));
                      },
                      hoverColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Text(
                        "LogIn As N.G.Os",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
