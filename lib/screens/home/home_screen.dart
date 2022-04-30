import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/screens/home/widget/emoji_text.dart';
import 'package:ecommerce/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/category/bloc/category_bloc.dart';
import '../../blocs/product/bloc/product_bloc.dart';
import '../../constants/colors.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  // ignore: use_key_in_widget_constructors
  const HomeScreen();

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
              const SectionTitle(title: 'RECOMMEND ITEMS'),
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
                  } else {
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
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
              const SectionTitle(title: 'SPECIAL ITEMS'),
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
                            .where((product) =>
                                !product.isPopular || !product.isRecommend)
                            .toList());
                  } else {
                    return const Text('Something went wrong');
                  }
                },
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
