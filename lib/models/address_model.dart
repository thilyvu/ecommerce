import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  String? id;
  String? name;
  String? phone;
  String? street;
  String? province;
  String? ward;

  Address({
    this.id,
    this.name,
    this.phone,
    this.street,
    this.province,
    this.ward,
  });

  Address update({
    String? name,
    String? phone,
    String? street,
    String? province,
    String? ward,
  }) =>
      Address(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        street: street ?? this.street,
        province: province ?? this.province,
        ward: ward ?? this.ward,
      );

  static String concatAddress(Address address) {
    return address.street.toString() +
        ' ,' +
        address.province.toString() +
        ' ,' +
        address.ward.toString() +
        '.';
  }

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
        id: snap.id,
        name: snap['name'],
        phone: snap['phone'],
        street: snap['street'],
        province: snap['province'],
        ward: snap['ward']);
    return address;
  }
}
