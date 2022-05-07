import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final DOCUMENT_NAME = "address";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;
  String uid = Get.find<UserController>().uid;

  RxList<Address> address = RxList<Address>([]);

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    address.bindStream(getAllAddress());
  }

  String? validateName(String value) =>
      value.isEmpty ? "Name can not be empty" : null;
  String? validatePhone(String value) =>
      value.isEmpty ? "Phone can not be empty" : null;
  String? validateStreet(String value) =>
      value.isEmpty ? "Street can not be empty" : null;
  String? validateProvince(String value) =>
      value.isEmpty ? "Province can not be empty" : null;
  String? validateWard(String value) =>
      value.isEmpty ? "Ward can not be empty" : null;

  Stream<List<Address>> getAllAddress() =>
      documentReference.collection(DOCUMENT_NAME).snapshots().map((query) =>
          query.docs.map((item) => Address.fromSnapshot(item)).toList());

  void addNewAddress(Address address) {
    documentReference
        .collection(DOCUMENT_NAME)
        .add(address.toJson())
        .whenComplete(() {
      Get.back();
      Utils.showSnackBar("New Address's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void deleteAddress(String id) {
    documentReference
        .collection(DOCUMENT_NAME)
        .doc(id)
        .delete()
        .whenComplete(() {
      Get.back();
      Utils.showSnackBar("Deleted successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
