import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/order_summary_product_card.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const OrderConfirmation(),
        settings: const RouteSettings(name: routeName));
  }

  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'BACK TO SHOPPING',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ))
          ]),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                  left: (MediaQuery.of(context).size.width - 150) / 2,
                  top: 70,
                  child: SvgPicture.asset(
                    'assets/svgs/partyFlag.svg',
                    color: Colors.white,
                    width: 200,
                    height: 150,
                  )),
              Positioned(
                top: 250,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text('Your order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Thi Ly Vu',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Thank you for purchasing on Unicorn.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ORDER CODE : #k321-edk1',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const OrderSummary(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ORDER DETAIL',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                // BlocBuilder<CartBloc, CartState>(
                //   builder: (context, state) {
                //     if(state is CartLoaded) {
                //           return ListView(
                //                 shrinkWrap: true,
                //                 padding: EdgeInsets.zero,
                //                 physics: const NeverScrollableScrollPhysics(),
                //                 // ignore: prefer_const_literals_to_create_immutables
                //                 children: [

                //                   OrderSummaryProductCard(product: Product.products[0], quantity: 2,),
                //                   OrderSummaryProductCard(product: Product.products[1], quantity: 2,)
                //                 ],
                //               );
                //     }
                //      return const Text('Something went wrong');

                //   },
                // )
              ],
            ),
          )
        ],
      )),
    );
  }
}
