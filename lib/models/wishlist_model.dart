import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  String? id;
  Product? product;

  Wishlist({
    this.id,
    this.product,
  });

  @override
  List<Object?> get props => [product];

  static Wishlist fromSnapshot(DocumentSnapshot snap) {
    Wishlist wishlist = Wishlist(
      id: snap.id,
      product: Product.fromJson(snap['product']),
    );
    return wishlist;
  }

  Map<String, dynamic> toJson() => {
        'product': product!.toJson(),
      };
}
