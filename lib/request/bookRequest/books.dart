import 'package:flutter/material.dart';
import 'package:flutter_application_1/fetch/bookfetch/booksremote_data.dart';
import 'package:flutter_application_1/fetch/foodfetch/foomodel.dart';

class books extends StatefulWidget {
  const books({super.key});

  @override
  State<books> createState() => _booksState();
}

class _booksState extends State<books> {
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController descr = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  checkvalidation(GlobalKey<FormState> _formkey) {
    if (_formkey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Donate Books"),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              SizedBox(
                height: 30,
                child: Text(
                  "PERSONAL DETAIL",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("This Field Can't be Empty");
                  }
                },
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("This Field Can't be Empty");
                  }
                },
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your Email");
                  }

                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a Valid Email");
                  }
                  return null;
                },
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
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("This Field Can't be Empty");
                  }
                },
                controller: address,
                minLines: 3,
                maxLines: 20,
                decoration: InputDecoration(
                    hintText: "ADDRESS",
                    labelText: "ADD YOUR ADDRESS",
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("This Field Can't be Empty");
                  }
                },
                controller: total,
                decoration: InputDecoration(
                    hintText: "ADD NUMBER OF BOOKS",
                    labelText: "TOTAL BOOKS",
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("This Field Can't be Empty");
                  }
                },
                controller: descr,
                minLines: 3,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "DESCRIPTION",
                    labelText: "ADD DESCRIPTION OF ALL BOOKS",
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
                    if (checkvalidation(_formkey) == false) {
                      FirestoreHelper2.create((UserModel(
                          name: name.text,
                          contact: contact.text,
                          email: email.text,
                          address: address.text,
                          total: total.text,
                          descr: descr.text)));
                    }
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
            ]),
          ),
        ),
      ),
    );
  }
}
