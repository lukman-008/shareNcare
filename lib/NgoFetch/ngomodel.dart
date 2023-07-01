import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? NAME;

  final String? EMAIL;
  final String? WEBSITE;

  UserModel({
    this.NAME,
    this.EMAIL,
    this.WEBSITE,
  });
  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      NAME: snapshot['NAME'],
      EMAIL: snapshot['EMAIL'],
      WEBSITE: snapshot['WEBSITE'],
    );
  }

  Map<String, dynamic> toJson() => {
        "NAME": NAME,
        "EMAIL": EMAIL,
        "WEBSITE": WEBSITE,
      };
}
