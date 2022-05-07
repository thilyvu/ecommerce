import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCartButton extends GetView<CartController> {
  final Product product;
  const AddCartButton(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () {
          controller.addProductToCart(product);
        },
        child: Text(
          'ADD TO CART',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
        ));
  }
}
