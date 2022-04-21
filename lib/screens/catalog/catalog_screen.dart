
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      builder: (context) => CatalogScreen(category: category),
      settings: const RouteSettings(name: routeName),
    );
  }

  final Category category;
  // ignore: use_key_in_widget_constructors
  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(),
        body: GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.1),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard.catalog(product:categoryProducts[index])
              );
            })
        // ProductCard(product: Product.products[0]),
        );
  }
}
