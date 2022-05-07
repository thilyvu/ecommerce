import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductCard extends GetView<WishlistController> {
  const ProductCard.product(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishList = false,
      this.height = 150,
      this.isCart = false,
      this.isCatalog = false,
      this.isProduct = true,
      this.isSummary = false,
      this.fontColor = Colors.white,
      this.iconColor = Colors.white,
      this.quantity})
      : super(key: key);

  const ProductCard.wishlist(
      {Key? key,
      required this.product,
      this.widthFactor = 1.1,
      this.leftPosition = 5,
      this.isWishList = true,
      this.height = 150,
      this.isCart = false,
      this.isCatalog = false,
      this.isProduct = false,
      this.isSummary = false,
      this.fontColor = Colors.white,
      this.iconColor = Colors.white,
      this.quantity})
      : super(key: key);
  const ProductCard.cart(
      {Key? key,
      required this.product,
      this.widthFactor = 2.25,
      this.leftPosition = 5,
      this.isWishList = false,
      this.height = 80,
      this.isCart = true,
      this.isCatalog = false,
      this.isProduct = false,
      this.isSummary = false,
      this.fontColor = Colors.black,
      this.iconColor = Colors.black,
      this.quantity})
      : super(key: key);
  const ProductCard.summary(
      {Key? key,
      required this.product,
      this.widthFactor = 2.25,
      this.leftPosition = 5,
      this.isWishList = false,
      this.height = 80,
      this.isCart = false,
      this.isCatalog = false,
      this.isProduct = false,
      this.isSummary = true,
      this.fontColor = Colors.black,
      this.iconColor = Colors.black,
      this.quantity})
      : super(key: key);
  const ProductCard.catalog(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishList = false,
      this.height = 150,
      this.isCart = false,
      this.isCatalog = true,
      this.isProduct = false,
      this.isSummary = false,
      this.fontColor = Colors.white,
      this.iconColor = Colors.white,
      this.quantity})
      : super(key: key);
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  final int? quantity;
  final bool isCatalog;
  final bool isSummary;
  final bool isCart;
  final bool isProduct;
  final double height;
  final Color iconColor;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;
    return InkWell(
      onTap: () {
        Get.toNamed("/product/" + product.id!);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ProductImage(
            adjWidth: adjWidth,
            product: product,
            height: height,
          ),
          ProductBackground(
            adjWidth: adjWidth,
            widgets: [
              Expanded(
                flex: 3,
                child: ProductInformation(
                  product: product,
                  fontColor: fontColor,
                ),
              ),
              ProductAction(product: product),
              isWishList
                  ? Expanded(
                      child: IconButton(
                          onPressed: () {
                            controller.removeProductFromWishlist(product.id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          )))
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}

class ProductAction extends GetView<CartController> {
  const ProductAction({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IconButton(
            onPressed: () {
              controller.addProductToCart(product);
            },
            icon: const Icon(
              Icons.add_circle,
              color: Colors.white,
            )));
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation(
      {Key? key,
      required this.product,
      required this.fontColor,
      this.isOrderSummary = false,
      this.quantity})
      : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name!,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
        Text(
          '\$${product.price}',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjWidth,
    required this.product,
    required this.height,
  }) : super(key: key);

  final double adjWidth;
  final Product product;
  final double height;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: adjWidth,
      height: height,
      child: Image.network(product.imageUrl!, fit: BoxFit.cover),
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground(
      {Key? key, required this.adjWidth, required this.widgets})
      : super(key: key);
  final double adjWidth;
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: Colors.black.withAlpha(80)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...widgets]),
        ),
      ),
    );
  }
}
