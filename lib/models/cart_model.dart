import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/voucher_model.dart';
import 'package:equatable/equatable.dart';

class Cart {
  String? id;
  Product? product;
  int? quantity;

  Cart({
    this.id,
    this.product,
    this.quantity,
  });

  @override
  List<Object?> get props => [product, quantity];

  static Cart fromSnapshot(DocumentSnapshot snap) {
    Cart cart = Cart(
      id: snap.id,
      product: Product.fromJson(snap['product']),
      quantity: snap['quantity'],
    );
    return cart;
  }

  Map<String, dynamic> toJson() => {
        'product': product!.toJson(),
        'quantity': quantity,
      };

  static Cart fromJson(Map<String, dynamic> json) => Cart(
        product: Product.fromJson(json['product']),
        quantity: json['quantity'],
      );

  static double subTotal(List<Cart> cart) {
    double sum = 0;
    var totalList = cart.map((e) => e.quantity! * e.product!.price!.toDouble());
    totalList.forEach((element) => sum += element);
    return sum;
  }

  static double total(List<Cart> cart, Voucher voucher) {
    double discount =
        voucher.discount != null ? voucher.discount!.toDouble() : 0;
    return subTotal(cart) + deliveryFee() - discount;
  }

  static double deliveryFee() {
    return 10.0;
  }
}
