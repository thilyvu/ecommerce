import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/widgets/hero_casual_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCarouse extends GetView<CategoryController> {
  const CategoryCarouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return CarouselSlider(
    //       options: CarouselOptions(
    //           aspectRatio: 1.5,
    //           viewportFraction: 0.9,
    //           enlargeStrategy: CenterPageEnlargeStrategy.height,
    //           enableInfiniteScroll: true,
    //           enlargeCenterPage: true,
    //           autoPlay: true),
    //       items: controller.category
    //           .map((item) => HeroCarouselCard(category: item))
    //           .toList(),
    //     );
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: controller.category.value.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    controller.category.value[index].imageUrl!,
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.2, 0.7],
                        colors: [Colors.black, Colors.white],
                        // stops: [0.0, 0.1],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                      padding: const EdgeInsets.all(1),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          controller.category.value[index].name!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
