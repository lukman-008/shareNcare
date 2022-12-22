import 'package:flutter/material.dart';

class money extends StatefulWidget {
  const money({super.key});

  @override
  State<money> createState() => _moneyState();
}

class _moneyState extends State<money> {
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
                TextFormField(
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
                    onPressed: () {},
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
