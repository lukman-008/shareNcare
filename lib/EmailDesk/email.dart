import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class email extends StatefulWidget {
  const email({Key? key}) : super(key: key);

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController subjectContoller = TextEditingController();
  TextEditingController emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('ShareNCare Email Desk'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: 'Users Name',
                    labelText: 'Users Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: nameController1,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_balance),
                    hintText: 'N.G.Os Name',
                    labelText: 'N.G.Os Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailContoller,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "User's Email",
                    labelText: "User's Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: subjectContoller,
                decoration: InputDecoration(
                    icon: Icon(Icons.abc),
                    hintText: 'Subject',
                    labelText: 'Subject',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: messageController,
                minLines: 3,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 35,
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 10, 10, 11),
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                  onPressed: () {
                    SendEmail();
                    Fluttertoast.showToast(msg: "Email Send Successfully");
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future SendEmail() async {
    const serviceId = 'service_uc1ugq6';
    const templateId = 'template_msm99gg';
    const userId = '_Pfmg0CjH8HNbemws';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            "template_params": {
              "to_name": nameController.text,
              "from_name": nameController1.text,
              "subject": subjectContoller.text,
              "message": messageController.text,
              "to_email": emailContoller.text,
            }
          },
        ));

    return response.statusCode;
  }
}
