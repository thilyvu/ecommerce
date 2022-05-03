import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ListAddress extends GetView<AddressController> {
  static const String routeName = '/list-address';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => ListAddress(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final AddressController categoryController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Choose Address'),
        // bottomNavigationBar: const CustomNavBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                controller.address.isEmpty
                    ? const Text(
                        "You already haven't added address yet!! \nPlease add new address !!")
                    : Obx(() => ListView.builder(
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'Add New Address',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ))
              ],
            ),
          ],
        ));
  }
}
