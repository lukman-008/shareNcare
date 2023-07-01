import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? contact;
  final String? email;
  final String? address;
  final String? total;
  final String? descr;
  UserModel(
      {this.contact,
      this.name,
      this.total,
      this.address,
      this.email,
      this.descr});
  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot['name'],
      contact: snapshot['contact'],
      email: snapshot['email'],
      address: snapshot['address'],
      total: snapshot['total'],
      descr: snapshot['descr'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
        "email": email,
        "address": address,
        "total": total,
        "descr": descr,
      };
}
