// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/models/card_model.dart';
import 'package:ecommerce/repositories/checkout/checkout_reposity.dart';
import 'package:equatable/equatable.dart';

import '../../../models/checkout_model.dart';
import '../../../models/product_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubcription;
  StreamSubscription? _checkoutSubcription;
  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subTotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
    _cartSubcription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  void _onConfirmCheckout(
      ConfirmCheckout event,Emitter<CheckoutState> emit) async{
    final state = this.state;
    _checkoutSubcription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        // ignore: avoid_print
        print('done');
        // emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  void _onUpdateCheckout(
      UpdateCheckout event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subTotal: event.cart?.subtotalString ?? state.subTotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode));
    }
  }
}
