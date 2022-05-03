import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../blocs/product/bloc/product_bloc.dart';

class TestScreen extends GetView<AddressController> {
  static const String routeName = '/test';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => TestScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final AddressController categoryController = Get.put(AddressController());

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
            appBar: CustomAppBar(title: "TEST"),
            bottomNavigationBar: const CustomNavBar(),
            body: Obx(() => ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: controller.address.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.address[index].name.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "123",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
            // ProductCard(product: Product.products[0]),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
