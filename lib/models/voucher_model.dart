import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Voucher {
  String? id;
  String? name;
  String? code;
  int? discount;
  String? desc;

  Voucher({this.id, this.name, this.code, this.discount, this.desc});

  Voucher update({
    String? id,
    String? name,
    String? code,
    int? discount,
    String? desc,
  }) =>
      Voucher(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        discount: discount ?? this.discount,
        desc: desc ?? this.desc,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'discount': discount,
        'desc': desc,
      };

  static Voucher fromSnapshot(DocumentSnapshot snap) {
    Voucher voucher = Voucher(
      id: snap.id,
      name: snap['name'],
      code: snap['code'],
      discount: snap['discount'],
      desc: snap['desc'],
    );
    return voucher;
  }

  static Voucher fromJson(Map<String, dynamic> json) => Voucher(
      name: json['name'],
      code: json['code'],
      discount: json['discount'],
      desc: json['desc']);
}
