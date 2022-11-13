import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    title: "TechPath",
    debugShowCheckedModeBanner: false,
    routes: {
      "/": ((context) => splashScreen()),
    },
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white)],
      ),
      child: TextFormField(
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
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => dashboard()));
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
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
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
                      height: 30,
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
                      height: 8,
                    ),
                    button,
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text("OR"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
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
