import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAddressPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: buildAppBar(context, 'Choose Address'),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    controller.address.value.isEmpty
                        ? const Text(
                            "You already haven't added address yet!! \nPlease add new address !!")
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10.0),
                            itemCount: controller.address.value.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.find<CartController>()
                                    .chooseAddress(
                                        controller.address.value[index]),
                                onPanUpdate: (details) {
                                  // Swiping in right direction.
                                  if (details.delta.dx > 0) {}

                                  // Swiping in left direction.
                                  if (details.delta.dx < 0) {
                                    controller.deleteAddress(
                                        controller.address.value[index].id!);
                                  }
                                },
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          controller.address.value[index].name
                                                  .toString() +
                                              ' - ' +
                                              controller
                                                  .address.value[index].phone
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          Address.concatAddress(
                                              controller.address.value[index]),
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          Navigator.pushNamed(context, '/customer-info');
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
              ),
            ],
          )),
    );
  }
}
