import 'package:ecommerce/models/checkout_model.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/bloc/checkout_bloc.dart';

class CustomerInfo extends StatefulWidget {
  static const String routeName = '/customer-info';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const CustomerInfo(),
        settings: const RouteSettings(name: routeName));
  }

  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CheckoutLoaded) {
          return Scaffold(
              appBar: buildAppBar(context, 'Add New Address'),
              bottomNavigationBar: BottomAppBar(
                color: Colors.black,
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 70,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                            if (state is CheckoutLoading) {
                              return const CircularProgressIndicator();
                            }
                            if (state is CheckoutLoaded) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  onPressed: () =>
                                      addNewAddress(state.checkout),
                                  child: Text(
                                    'Add New Address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.black),
                                  ));
                            } else {
                              return const Text('Some thing went wrong');
                            }
                          },
                        )
                      ]),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Name'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Phone'),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, context, 'Street'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, context, 'Ward'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, context, 'District'),
                  ],
                ),
              ));
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }

  Padding _buildTextFormField(
      Function(String)? onChanged, BuildContext context, String lableText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            lableText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ))
      ]),
    );
  }

  void addNewAddress(Checkout checkout) {
    // context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
    // Utils.showSnackBar('Order successful!', 'primary');

    // Navigator.pushNamed(context, '/order-confirmation');

    // FireStorePreference.addNewAddress(checkout, context);
  }
}