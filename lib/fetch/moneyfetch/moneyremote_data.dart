import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/fetch/moneyfetch/moneymodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreHelper3 {
  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("money");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("money");
    final docRef = userCollection.doc();
    final newUser = UserModel(
      name: user.name,
      contact: user.contact,
      email: user.email,
      total: user.total,
      transid: user.transid,
    ).toJson();
    try {
      await docRef.set(newUser);
      Fluttertoast.showToast(msg: "Successfully Added");
    } catch (e) {
      print("some error occured $e");
    }
  }
}
