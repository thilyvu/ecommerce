import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistIcon extends GetView<WishlistController> {
  final Product product;
  const WishlistIcon(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          controller.addProductToWishlist(product);
          Utils.showSnackBar('Added to your Wishlist!', 'primary');
        },
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ));
  }
}
