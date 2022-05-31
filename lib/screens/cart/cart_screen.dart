import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/screens/address/list_address.dart';
import 'package:ecommerce/screens/cart/widget/address_widget.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => cartController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: const CustomAppBar(title: "Cart"),
            body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            if (cartController.choseAddress().name != null)
                              AddressWidget(
                                  name: cartController.choseAddress.value.name!,
                                  phone:
                                      cartController.choseAddress.value.phone!,
                                  address: Address.concatAddress(
                                      cartController.choseAddress())),
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
                              height: 300,
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(children: [
                                        Image.network(
                                          cartController.carts.value[index]
                                              .product!.imageUrl!,
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
                                                cartController
                                                    .carts
                                                    .value[index]
                                                    .product!
                                                    .name!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5,
                                              ),
                                              Text(
                                                '\$${cartController.carts.value[index].product!.price}',
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
                                                  cartController
                                                      .decreasedCartItem(
                                                          index,
                                                          cartController.carts
                                                              .value[index]);
                                                },
                                                icon: const Icon(
                                                    Icons.remove_circle)),
                                            Text(
                                                cartController
                                                    .carts.value[index].quantity
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4),
                                            IconButton(
                                                onPressed: () {
                                                  cartController
                                                      .increaseCartItem(
                                                          cartController
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
                                  itemCount: cartController.carts.value.length),
                            ),
                          ],
                        ),
                        OrderSummary(),
                      ]),
                ])));
  }
}
