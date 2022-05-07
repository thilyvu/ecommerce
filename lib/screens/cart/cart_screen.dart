import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/screens/address/list_address.dart';
import 'package:ecommerce/screens/cart/widget/list_card.dart';
import 'package:ecommerce/screens/loading_screen.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/cart_product_card.dart';

class CartScreen extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
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
            body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(Address.concatAddress(
                                Get.find<AddressController>()
                                    .choseAddress
                                    .value)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("CART ITEMS",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.to(ListAddressPage());
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
                            const SizedBox(height: 380, child: ListCard()),
                          ],
                        ),
                        OrderSummary(),
                      ]),
                ])));
  }
}
