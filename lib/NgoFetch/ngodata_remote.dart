import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/NgoFetch/ngomodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreHelper4 {
  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("ngos");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }
}
