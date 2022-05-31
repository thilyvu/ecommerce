import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/home/widget/category_grid.dart';
import 'package:ecommerce/screens/home/widget/emoji_text.dart';
import 'package:ecommerce/screens/home/widget/search_input.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends GetView {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const EmojiText(),
              const SearchInput(),
              const SectionTitle(title: 'CATEGORIES'),
              CategoryGrid(),
              const SectionTitle(title: 'RECOMMEND ITEMS'),
              Obx(
                () => ProductCarousel(
                    products: productController.getProductsRecommend()),
              ),
              const SectionTitle(title: 'POPULAR'),
              Obx(
                () => ProductCarousel(
                    products: productController.getProductsPopular()),
              ),
              const SectionTitle(title: 'SPECIAL ITEMS'),
              Obx(
                () => ProductCarousel(
                    products: productController.getProductsSpecial()),
              ),
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
          'Hello !!',
          style: TextStyle(color: kFontLight, fontSize: 16),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => WishlistScreen());
          },
          icon: const Icon(Icons.favorite),
          color: Colors.black,
        )
      ],
    );
  }
}
