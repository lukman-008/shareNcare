import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/userlogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class signup extends StatefulWidget {
  const signup({super.key});
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formkey = GlobalKey<FormState>();
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
        onChanged: (value) {
          password = value;
        },
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

    final ConfirmpasswordField = Container(
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
            labelText: "Confirm Password",
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
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email, password: password);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => homepage())));
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
              Fluttertoast.showToast(
                  backgroundColor: Color.fromARGB(255, 13, 80, 136),
                  msg: "The account already exists for that email.");
            }
          } catch (e) {
            print(e);
            Fluttertoast.showToast(msg: "Signed Up Successfully");
          }
        },
        hoverColor: Colors.black,
        padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
        child: Text(
          "SignUp",
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
                        "SIGNUP",
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
                      height: 10,
                    ),
                    passwordField,
                    SizedBox(
                      height: 10,
                    ),
                    ConfirmpasswordField,
                    SizedBox(
                      height: 8,
                    ),
                    button,
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Already a member?"),
                            TextButton(
                                onPressed: ((() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => homepage())));
                                })),
                                child: Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 13, 80, 136),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
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
