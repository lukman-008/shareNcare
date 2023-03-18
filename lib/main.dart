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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "ShareNCare",
    debugShowCheckedModeBanner: false,
    routes: {
      "/": ((context) => splashScreen()),
    },
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: "INVALID EMAIL OR PASSWORD");
    }
    return user;
  }

  final formkey = GlobalKey<FormState>();
  checkvalidation(GlobalKey<FormState> formkey) {
    if (formkey.currentState!.validate()) {
      print('VALIDATED');
    } else {
      print('NOT VALIDATED');
    }
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    final emailField = Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white)],
      ),
      child: TextFormField(
        onChanged: (value) {
          email = value;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }

          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a Valid Email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: "Email",
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        autofocus: false,
      ),
    );
    final passwordField = Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white)],
      ),
      child: TextFormField(
        onChanged: ((value) {
          password = value;
        }),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please Enter your Password");
          }
          if (!regex.hasMatch(value)) {
            return ("Please Enter Valid Password Min. of 6 charater ");
          }
        },
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.key),
            labelText: "Password",
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        autofocus: false,
      ),
    );
    final button = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white)],
        color: Color.fromARGB(255, 3, 168, 244),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: () async {
          checkvalidation(formkey);
          User? user = await loginUsingEmailPassword(
              email: email, password: password, context: context);
          print(user);
          if (user != null) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => dashboard()));
          }
        },
        hoverColor: Colors.black,
        padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
        child: Text(
          "LogIn",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/new.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              height: 550,
              width: 450,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 3, 168, 244)
                  ])),
              child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 250,
                          child: Lottie.network(
                              "https://assets8.lottiefiles.com/packages/lf20_jcikwtux.json"),
                        ),
                        emailField,
                        SizedBox(
                          height: 25,
                        ),
                        passwordField,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: (() {}),
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        button,
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/google.png"))),
                          ),
                          onTap: () {
                            AuthService().signInWithGoogle();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => dashboard())));
                          },
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "  Not a member?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signup()));
                                      },
                                      child: Text(
                                        "SignUp",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 13, 80, 136),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
