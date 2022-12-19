import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/dashboard.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red, statusBarBrightness: Brightness.light),
        centerTitle: true,
        title: Text("Astra"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: 50,
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange]),
                  ),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("hello"),
                      Text("hi"),
                      Text("how are you feeling today"),
                    ],
                  ))),
              Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange])),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Email"),
                  trailing: Icon(Icons.send),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange])),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Email"),
                  trailing: Icon(Icons.send),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange])),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Exit"),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => dashboard())));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
