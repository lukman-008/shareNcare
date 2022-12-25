import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodremote_data.dart';

import 'package:flutter_application_1/ngodata_remote.dart';
import 'package:flutter_application_1/ngomodel.dart';

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
        title: Text("FELLOW N.G.OS"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<List<UserModel>>(
                stream: FirestoreHelper4.read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("some error occured"),
                    );
                  }
                  if (snapshot.hasData) {
                    final userdata = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                          itemCount: userdata!.length,
                          itemBuilder: (context, index) {
                            final singleuser = userdata[index];
                            return Container(
                              margin: EdgeInsets.only(top: 10, bottom: 7),
                              child: ListTile(
                                tileColor: Color.fromARGB(255, 220, 217, 217),
                                title: Text("Name :- ${singleuser.NAME}" +
                                    "\nEmail :- ${singleuser.EMAIL}" +
                                    "\nWebsite:- ${singleuser.WEBSITE}"),
                              ),
                            );
                          }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
