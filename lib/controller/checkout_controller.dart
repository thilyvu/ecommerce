import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/checkout_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

import '../models/checkout_model.dart';

class CheckoutController extends GetxController {
  final DOCUMENT_NAME = "checkout";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;
  String uid = Get.find<UserController>().uid;

  RxList<Checkout> checkout = RxList<Checkout>([]);

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    checkout.bindStream(getAllCheckout());
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

  Stream<List<Checkout>> getAllCheckout() =>
      documentReference.collection(DOCUMENT_NAME).snapshots().map((query) =>
          query.docs.map((item) => Checkout.fromSnapshot(item)).toList());

  void addNewOrder(Checkout checkout) {
    documentReference
        .collection(DOCUMENT_NAME)
        .add(checkout.toDocument())
        .whenComplete(() {
      Get.back();
      Utils.showSnackBar("New Checkout's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void deleteOrder(String id) {
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
