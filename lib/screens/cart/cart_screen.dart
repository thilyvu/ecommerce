import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/screens/address/list_address.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                            Text(controller.choseAddress.name == 'null'
                                ? Address.concatAddress(controller.choseAddress)
                                : ""),
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
                            SizedBox(
                              height: 380,
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(children: [
                                        Image.network(
                                          controller.carts.value[index].product!
                                              .imageUrl!,
                                          width: 100,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.carts.value[index]
                                                    .product!.name!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5,
                                              ),
                                              Text(
                                                '\$${controller.carts.value[index].product!.price}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.decreasedCartItem(
                                                      index,
                                                      controller
                                                          .carts.value[index]);
                                                },
                                                icon: const Icon(
                                                    Icons.remove_circle)),
                                            Text(
                                                controller
                                                    .carts.value[index].quantity
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4),
                                            IconButton(
                                                onPressed: () {
                                                  controller.increaseCartItem(
                                                      controller
                                                          .carts
                                                          .value[index]
                                                          .product!);
                                                },
                                                icon: const Icon(
                                                    Icons.add_circle))
                                          ],
                                        )
                                      ]),
                                    );
                                  },
                                  itemCount: controller.carts.value.length),
                            ),
                          ],
                        ),
                        OrderSummary(),
                      ]),
                ])));
  }
}
