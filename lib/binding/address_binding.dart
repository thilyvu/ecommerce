import 'package:ecommerce/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(
      () => AddressController(),
    );
  }
}
