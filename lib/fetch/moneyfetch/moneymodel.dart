import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? contact;
  final String? email;
  final String? total;
  final String? transid;
  UserModel({this.contact, this.name, this.total, this.email, this.transid});
  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot['name'],
      contact: snapshot['contact'],
      email: snapshot['email'],
      total: snapshot['total'],
      transid: snapshot['transid'],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
        "email": email,
        "total": total,
        "transid": transid,
      };
}
