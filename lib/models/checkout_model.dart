import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/voucher_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  String? id;
  Address? address;
  List<Cart>? cart;
  double? total;
  double? subTotal;
  double? deliveryFee;
  Voucher? voucher;
  Checkout({
    this.id,
    this.address,
    this.cart,
    this.subTotal,
    this.deliveryFee,
    this.total,
    this.voucher,
  });

  @override
  List<Object?> get props =>
      [address, subTotal, deliveryFee, total, voucher, cart];

  static Checkout fromSnapshot(DocumentSnapshot snap) {
    var a = snap['cart'];
    Checkout cart = Checkout(
      id: snap.id,
      address: Address.fromJson(snap['address']),
      cart: snap['cart'],
      voucher: Voucher.fromJson(snap['voucher']),
      total: snap['total'],
      subTotal: snap['subTotal'],
      deliveryFee: snap['deliveryFee'],
    );
    return cart;
  }

  Map<String, dynamic> toJson() => {
        'address': address!.toJson(),
        'cart': cart!,
        'voucher': voucher!.toJson(),
        'total': total,
        'subTotal': subTotal,
        'deliveryFee': deliveryFee,
      };
}
