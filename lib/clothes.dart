import 'package:flutter/material.dart';

class clothes extends StatefulWidget {
  const clothes({super.key});

  @override
  State<clothes> createState() => _clothesState();
}

class _clothesState extends State<clothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Donate Clothes"),
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
    ;
  }
}
