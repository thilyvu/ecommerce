import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileName extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    int number = Get.put(CheckoutController()).numberOfOrders();
    String customerType = number > 10
        ? "Gold Member"
        : number > 5
            ? "Silver Member"
            : "Bronze Member";
    final colorCustomer = number > 10
        ? Color.fromARGB(255, 179, 162, 10)
        : number > 5
            ? Color.fromARGB(120, 184, 178, 178)
            : Colors.brown;
    return Obx(
      () => Column(
        children: [
          Text(
            customerType,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 179, 162, 10)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            controller.user.value.displayName!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            controller.user.value.email!,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
