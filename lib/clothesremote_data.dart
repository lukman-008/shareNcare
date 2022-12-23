import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/foomodel.dart';

class FirestoreHelper1 {
  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("Clothes");
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
    } catch (e) {
      print("some error occured $e");
    }
  }
}
