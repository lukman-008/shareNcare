import 'package:flutter/material.dart';

class food extends StatefulWidget {
  const food({super.key});

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Donate Food"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(children: [
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
                "ADD DETAILS",
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
                hintText: "ADD FOOD QUANTITY",
                labelText: "ADD TOTAL QUANTITY",
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
            minLines: 3,
            maxLines: 20,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: "DESCRIPTION",
                labelText: "ADD COMLETE DESCRIPTION",
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
        ]),
      ),
    );
  }
}
