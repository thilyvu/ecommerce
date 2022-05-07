import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/screens/cart/widget/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCard extends GetView<CartController> {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return CartProductCard(
              product: controller.cart.value[index].product!,
              quantity: controller.cart.value[index].quantity!);
        },
        itemCount: controller.cart.value.length);
  }
}
