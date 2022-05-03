import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  String? name;
  String? phone;
  String? street;
  String? province;
  String? ward;

  Address({
    this.name,
    this.phone,
    this.street,
    this.province,
    this.ward,
  });

  static Address fromJson(Map<String, dynamic> json) => Address(
      name: json['name'],
      phone: json['phone'],
      street: json['street'],
      province: json['province'],
      ward: json['ward']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'street': street,
        'province': province,
        'ward': ward,
      };

  // @override
  // List<Object?> get props => throw UnimplementedError();
  static Address fromSnapshot(DocumentSnapshot snap) {
    Address address = Address(
        name: snap['name'],
        phone: snap['phone'],
        street: snap['street'],
        province: snap['province'],
        ward: snap['ward']);
    return address;
  }
}
