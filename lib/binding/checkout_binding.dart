import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );
  }
}
