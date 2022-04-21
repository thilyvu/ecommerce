part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;
  CheckoutLoaded(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.deliveryFee,
      this.products,
      this.subTotal,
      this.total,
      this.zipCode}): checkout = Checkout(
        address: address,
        city: city,
        country: country, 
        deliveryFee: deliveryFee,
        email: email,
        fullName: fullName,
        products: products,
        subTotal: subTotal,
        total: total,
        zipCode: zipCode,
        );
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
}
