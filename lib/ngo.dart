import 'package:flutter/material.dart';

class ngo extends StatefulWidget {
  const ngo({super.key});

  @override
  State<ngo> createState() => _ngoState();
}

class _ngoState extends State<ngo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NGOs"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
