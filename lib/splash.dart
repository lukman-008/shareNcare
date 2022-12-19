import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => homepage()));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.asset("assets/snc.png")),
            Container(
              height: 100,
              width: 100,
              child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_t5zkfmnt.json'),
            )
          ],
        ),
      ),
    );
  }
}
