import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/fetch/foodfetch/foomodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreHelper {
  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("food");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("food");
    final docRef = userCollection.doc();
    final newUser = UserModel(
      name: user.name,
      contact: user.contact,
      email: user.email,
      address: user.address,
      total: user.total,
      descr: user.descr,
    ).toJson();
    try {
      await docRef.set(newUser);
      Fluttertoast.showToast(msg: "Successfully Added");
    } catch (e) {
      print("some error occured $e");
    }
  }
}
