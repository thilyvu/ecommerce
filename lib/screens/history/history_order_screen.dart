import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/screens/history/widget/history_widget.dart';
import 'package:ecommerce/screens/history/widget/track_order.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/emptySection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryOrderPage extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "History Order"),
      body: Obx(() => controller.checkout.value.isEmpty
          ? Center(
              child: EmptySection(
                emptyImg: emptyOrders,
                emptyMsg: 'No orders yet',
              ),
            )
          : HistoryWidget()),
    );
  }
}
