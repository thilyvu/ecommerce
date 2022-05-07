import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
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
      product: snap['product'],
      quantity: snap['quantity'],
    );
    return cart;
  }

  Map<String, dynamic> toJson() => {
        'product': product,
        'quantity': quantity,
      };

  // const Cart({this.products = const <Product>[]});
  // @override
  // List<Object?> get props => [products];

  // Map productQuantity(products) {
  //   // ignore: prefer_collection_literals
  //   var quantity = Map();

  //   products.forEach((product) {
  //     if (!quantity.containsKey(product)) {
  //       quantity[product] = 1;
  //     } else {
  //       quantity[product] += 1;
  //     }
  //   });

  //   return quantity;
  // }

  // double get subtotal =>
  //     products.fold(0, (total, current) => total + current.price!);
  // String get subtotalString => subtotal.toStringAsFixed(2);
  // double deliveryFee(subtotal) {
  //   if (subtotal >= 30.0) {
  //     return 0.0;
  //   } else {
  //     return 10.0;
  //   }
  // }

  // String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  // String freeDelivery(subtotal) {
  //   if (subtotal >= 30.0) {
  //     return 'You have free Delivery';
  //   } else {
  //     double missing = 30.0 - subtotal;
  //     return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
  //   }
  // }

  // double total(subtotal, deliveryFee) {
  //   return subtotal + deliveryFee(subtotal);
  // }

  // String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  // String get freeDeliveryString => freeDelivery(subtotal);
}
