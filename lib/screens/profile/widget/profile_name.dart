import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileName extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          controller.user.displayName!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          controller.user.email!,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
