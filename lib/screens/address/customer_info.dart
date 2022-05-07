import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/screens/address/widget/text_field.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoPage extends GetView<AddressController> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final wardController = TextEditingController();
  final provinceController = TextEditingController();
  final streetController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Add New Address'),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextFieldAddress(
                    controller: nameController,
                    labelText: 'Name',
                    onValidate: (value) => controller.validateName(value!)),
                TextFieldAddress(
                  controller: phoneController,
                  labelText: 'Phone',
                  onValidate: (value) => controller.validatePhone(value!),
                ),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextFieldAddress(
                  controller: streetController,
                  labelText: 'Street',
                  onValidate: (value) => controller.validateStreet(value!),
                ),
                TextFieldAddress(
                  controller: provinceController,
                  labelText: 'Province',
                  onValidate: (value) => controller.validateProvince(value!),
                ),
                TextFieldAddress(
                  controller: wardController,
                  labelText: 'Ward',
                  onValidate: (value) => controller.validateWard(value!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: addNewAddress,
                        child: Text(
                          'Confirm',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void addNewAddress() {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    final Address address = Address(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      street: streetController.text.trim(),
      province: provinceController.text.trim(),
      ward: wardController.text.trim(),
    );

    controller.addNewAddress(address);
  }
}
