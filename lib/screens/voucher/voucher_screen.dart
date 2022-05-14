import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/voucher_controller.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherPage extends GetView {
  VoucherPage({Key? key}) : super(key: key);

  VoucherController voucherController = Get.put(VoucherController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: buildAppBar(context, 'Voucher List'),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          onChanged: (value) => print(value),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Search voucher",
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    voucherController.vouchers.value.isEmpty
                        ? const Text("None Available Voucher")
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10.0),
                            itemCount: voucherController.vouchers.value.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => cartController.chooseVoucher(
                                    voucherController.vouchers.value[index]),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              voucherController
                                                  .vouchers.value[index].name!,
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              voucherController
                                                  .vouchers.value[index].desc!,
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          voucherController.vouchers
                                                  .value[index].discount
                                                  .toString() +
                                              ".0",
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
