import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
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
}
