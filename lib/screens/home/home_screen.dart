import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/screens/home/widget/category_carouse.dart';
import 'package:ecommerce/screens/home/widget/emoji_text.dart';
import 'package:ecommerce/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        bottomNavigationBar: const CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const EmojiText(),
              const SearchInput(),
              // ignore: avoid_unnecessary_containers
              Container(child: const CategoryCarouse()),
              //section title
              const SectionTitle(title: 'RECOMMEND ITEMS'),
              Obx(() =>
                  ProductCarousel(products: controller.getProductsRecommend())),
              const SectionTitle(title: 'POPULAR'),
              Obx(() =>
                  ProductCarousel(products: controller.getProductsPopular())),
              const SectionTitle(title: 'SPECIAL ITEMS'),
              Obx(() =>
                  ProductCarousel(products: controller.getProductsSpecial())),
            ],
          ),
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackground,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'Hello Thi Ly Vu!',
          style: TextStyle(color: kFontLight, fontSize: 16),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: const Icon(Icons.favorite),
          color: Colors.black,
        )
      ],
    );
  }
}
