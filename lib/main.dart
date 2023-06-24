import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/ngoLogin.dart';
import 'package:flutter_application_1/ngodashboard.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:flutter_application_1/userlogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "ShareNCare",
    debugShowCheckedModeBanner: false,
    home: StreamBuilder<User?>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            return homepage();
          } else {
            return dashboard();
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    ),
  ));
}
