import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  String? fullName;
  String? email;
  String? address;
  String? city;
  String? country;
  String? zipCode;
  List<Product>? products;
  String? subTotal;
  String? deliveryFee;
  String? total;
  Checkout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subTotal,
    this.deliveryFee,
    this.total,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        subTotal,
        deliveryFee,
        total
      ];

  Map<String, Object> toDocument() {
    // ignore: prefer_collection_literals
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerrEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }

  static Checkout fromSnapshot(DocumentSnapshot snap) {
    final product = jsonDecode(snap['products']);
    Checkout checkout = Checkout(
      fullName: snap['customerName'],
      email: snap['customerrEmail'],
      address: snap['customerAddress']['address'],
      city: snap['customerAddress']['city'],
      country: snap['customerAddress']['country'],
      zipCode: snap['customerAddress']['zipCode'],
      products: snap['products'],
      subTotal: snap['subtotal'],
      deliveryFee: snap['deliveryFee'],
      total: snap['total'],
    );
    return checkout;
  }
}
