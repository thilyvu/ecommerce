import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: const CustomAppBar(title: "Checkout"),
        bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            // ignore: sized_box_for_whitespace
            child: Container(
                height: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: orderNow,
                          child: Text(
                            'ORDER NOW',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black),
                          )),
                    ]))),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CUSTOMER INFORMATION',
                style: Theme.of(context).textTheme.headline3,
              ),
              // _buildTextFormField((value) {
              //   context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
              // }, context, 'Email'),
              // _buildTextFormField((value) {
              //   context
              //       .read<CheckoutBloc>()
              //       .add(UpdateCheckout(fullName: value));
              // }, context, 'Name'),
              // Text(
              //   'DELIVERY INFORMATION',
              //   style: Theme.of(context).textTheme.headline3,
              // ),
              // _buildTextFormField((value) {
              //   context
              //       .read<CheckoutBloc>()
              //       .add(UpdateCheckout(address: value));
              // }, context, 'Address'),
              // _buildTextFormField((value) {
              //   context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
              // }, context, 'Ward'),
              // _buildTextFormField((value) {
              //   context
              //       .read<CheckoutBloc>()
              //       .add(UpdateCheckout(country: value));
              // }, context, 'District'),
              // _buildTextFormField((value) {
              //   context
              //       .read<CheckoutBloc>()
              //       .add(UpdateCheckout(zipCode: value));
              // }, context, 'Phone'),
              Text(
                'ORDER SUMMARY',
                style: Theme.of(context).textTheme.headline3,
              ),
              OrderSummary()
            ],
          ),
        )));
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

  void orderNow() {
    // context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
    // Utils.showSnackBar('Order successful!', 'primary');

    // Navigator.pushNamed(context, '/order-confirmation');

    // controller.addNewOrder()
  }
}
