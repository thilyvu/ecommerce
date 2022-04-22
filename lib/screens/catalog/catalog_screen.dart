import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/bloc/product_bloc.dart';

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
    // final List<Product> categoryProducts = Product.products
    //     .where((product) => product.category == category.name)
    //     .toList();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoaded) {
          return Scaffold(
              appBar: CustomAppBar(title: category.name),
              bottomNavigationBar: const CustomNavBar(),
              body: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.1),
                  itemCount: state.products.where((product) => product.category == category.name).toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: ProductCard.catalog(
                            product: state.products.where((product) => product.category == category.name).toList()[index]));
                  })
              // ProductCard(product: Product.products[0]),
              );
        }
          else { return const Text('Something went wrong'); }
      },
    );
  }
}
