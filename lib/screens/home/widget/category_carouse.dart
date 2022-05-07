import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/widgets/hero_casual_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCarouse extends GetView<CategoryController> {
  const CategoryCarouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: true),
          items: controller.category
              .map((item) => HeroCarouselCard(category: item))
              .toList(),
        ));
  }
}
