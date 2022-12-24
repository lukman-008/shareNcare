import 'package:flutter/material.dart';

import 'package:flutter_application_1/moneymodel.dart';
import 'package:flutter_application_1/moneyremote_data.dart';

class money extends StatefulWidget {
  const money({super.key});

  @override
  State<money> createState() => _moneyState();
}

class _moneyState extends State<money> {
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController transid = TextEditingController();
  TextEditingController total = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Money"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: Text(
                    "PERSONAL DETAIL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "NAME",
                      labelText: "ADD NAME/ORG. NAME",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  autofocus: false,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: contact,
                  decoration: InputDecoration(
                      hintText: "CONTACT NUMBER",
                      labelText: "CONTACT NUMBER",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  autofocus: false,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "EMAIL ADDRESS",
                      labelText: "EMAIL ADDRESS",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  autofocus: false,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 30,
                    child: Text(
                      "ADD MONEY IN RS.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: total,
                  decoration: InputDecoration(
                      hintText: "ADD MONEY IN RS.",
                      labelText: "ADD FIGURE",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  autofocus: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: transid,
                  decoration: InputDecoration(
                      hintText: "TRANSACTION ID",
                      labelText: "ADD TRANSACTION ID",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  autofocus: false,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                    boxShadow: [BoxShadow(blurRadius: 20, color: Colors.white)],
                    color: Color.fromARGB(255, 3, 168, 244),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      FirestoreHelper3.create((UserModel(
                          name: name.text,
                          contact: contact.text,
                          email: email.text,
                          total: total.text,
                          transid: transid.text)));
                    },
                    hoverColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
                    child: Text(
                      "ADD",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Ink.image(
                      image: AssetImage('assets/qr.jpg'),
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
