import 'package:ecommerce/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGrid extends GetView {
  CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
        ),
        itemCount: categoryController.category.value.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesTile(
            assetPath: categoryController.category.value[index].imageUrl!,
            color: Color(0xffFCE8A8),
            title: categoryController.category.value[index].name!,
            onPressed: () {
              Get.toNamed("/catalog/" +
                  categoryController.category.value[index].name!
                      .replaceAll(" ", "+"));
            },
          );
        }));
  }
}

class CategoriesTile extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;
  final onPressed;

  const CategoriesTile(
      {Key? key,
      this.color = Colors.black,
      required this.title,
      required this.assetPath,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GestureDetector(
                onTap: onPressed, // Image tapped
                child: ClipRRect(
                  child: Image.network(
                    assetPath,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ),
          SizedBox(height: 5),
          Text(
            this.title,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
