import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogScreen extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final categoryName = Get.parameters['name']!.replaceAll("+", " ");
    return Scaffold(
        appBar: CustomAppBar(title: categoryName),
        bottomNavigationBar: const CustomNavBar(),
        body: Obx(
          () => GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.1),
              itemCount:
                  controller.getProductsByCategoryId(categoryName).length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: ProductCard.catalog(
                        product: controller
                            .getProductsByCategoryId(categoryName)[index]));
              }),
        )
        // ProductCard(product: Product.products[0]),
        );
  }
}
