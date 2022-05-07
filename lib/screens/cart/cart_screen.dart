import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/cart_product_card.dart';

class CartScreen extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart"),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      child: Text(
                        'GO TO CHECKOUT',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.black),
                      ))
                ]),
          ),
        ),
        body: Obx(() => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("data"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(state.cart.freeDeliveryString,
                            //     style: Theme.of(context).textTheme.headline5),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/list-address');
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: const RoundedRectangleBorder(),
                                    elevation: 0),
                                child: Text(
                                  'Choose Address',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 380,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                    product: controller.cart[index].product!,
                                    quantity: controller.cart[index].quantity!);
                              },
                              itemCount: controller.cart.length),
                        ),
                      ],
                    ),
                    const OrderSummary(),
                  ]),
            )));
  }
}
