import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodremote_data.dart';
import 'package:flutter_application_1/foomodel.dart';

class foodfetch extends StatefulWidget {
  const foodfetch({super.key});

  @override
  State<foodfetch> createState() => _foodfetchState();
}

class _foodfetchState extends State<foodfetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FOOD SUPPLIES"),
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
                stream: FirestoreHelper.read(),
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
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text("Name :- ${singleuser.name}" +
                                    "\nEmail :- ${singleuser.email}" +
                                    "\nContact :- ${singleuser.contact}" +
                                    "\nAddress :- ${singleuser.address}" +
                                    "\nQuantity :- ${singleuser.total}" +
                                    "\nDescription :- ${singleuser.descr}"),
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
