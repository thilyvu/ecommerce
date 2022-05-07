import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Wishlist"),
        bottomNavigationBar: const CustomNavBar(),
        body: Obx(() => GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 2.4),
            itemCount: controller.wishlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard.wishlist(
                  product: controller.wishlist[index].product!,
                  widthFactor: 1.1,
                  leftPosition: 150,
                ),
              );
            })));
  }
}
