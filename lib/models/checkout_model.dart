import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/voucher_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  String? id;
  Address? address;
  List<Cart>? carts;
  double? total;
  double? subTotal;
  double? deliveryFee;
  Voucher? voucher;
  Timestamp? timestamp;
  int? status;
  double? rating;
  Checkout(
      {this.id,
      this.address,
      this.carts,
      this.subTotal,
      this.deliveryFee,
      this.total,
      this.voucher,
      this.timestamp,
      this.status,
      this.rating});

  @override
  List<Object?> get props => [
        address,
        subTotal,
        deliveryFee,
        total,
        voucher,
        carts,
        timestamp,
        status,
        rating,
      ];

  static Checkout fromSnapshot(DocumentSnapshot snap) {
    Checkout checkout = Checkout(
        id: snap.id,
        address: Address.fromJson(snap['address']),
        carts: snap['cart']
            .map<Cart>((mapString) => Cart.fromJson(mapString))
            .toList(),
        voucher: Voucher.fromJson(snap['voucher']),
        total: snap['total'],
        subTotal: snap['subTotal'],
        deliveryFee: snap['deliveryFee'],
        timestamp: snap['timestamp'],
        status: snap['status'],
        rating: snap['rating'].toDouble());
    return checkout;
  }

  Map<String, dynamic> toJson() => {
        'address': address!.toJson(),
        'cart': carts!.map((e) => e.toJson()).toList(),
        'voucher': voucher!.toJson(),
        'total': total,
        'subTotal': subTotal,
        'deliveryFee': deliveryFee,
        'timestamp': timestamp,
        'status': status,
        'rating': rating,
      };
}
