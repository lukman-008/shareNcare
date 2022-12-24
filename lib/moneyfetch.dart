import 'package:flutter/material.dart';
import 'package:flutter_application_1/moneymodel.dart';
import 'package:flutter_application_1/moneyremote_data.dart';

class moneyfetch extends StatefulWidget {
  const moneyfetch({super.key});

  @override
  State<moneyfetch> createState() => _moneyfetchState();
}

class _moneyfetchState extends State<moneyfetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MONEY DONATED"),
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
                stream: FirestoreHelper3.read(),
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
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 7, left: 15, right: 15),
                              child: ListTile(
                                tileColor: Color.fromARGB(255, 220, 217, 217),
                                title: Text("Name :- ${singleuser.name}" +
                                    "\nEmail :- ${singleuser.email}" +
                                    "\nContact :- ${singleuser.contact}" +
                                    "\nTotal Figure :- ${singleuser.total}" +
                                    "\nTransaction Id :- ${singleuser.transid}"),
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
