import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/category/bloc/category_bloc.dart';
import '../../blocs/product/bloc/product_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Ecommo"),
        bottomNavigationBar: const CustomNavBar(),
        body: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          autoPlay: true),
                      items: state.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
                    );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
            ),
            //section title
            const SectionTitle(title: 'RECOMMEND'),
            // //product carousel
            // ProductCard(product: Product.products[0],)
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommend)
                        .toList());
                }

                else {
                    return const Text('Something went wrong');
                  }
              },
            ),
            const SectionTitle(title: 'POPULAR'),
            // //product carousel
            // ProductCard(product: Product.products[0],)
           BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());
                }

                else {
                    return const Text('Something went wrong');
                  }
              },
            ),
          ],
        ));
  }
}
