import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/checkout_model.dart';
import 'package:get/get.dart';

import '../models/checkout_model.dart';

class CheckoutController extends GetxController {
  final DOCUMENT_NAME = "checkout";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;
  String uid = Get.find<UserController>().uid;

  var checkout = RxList<Checkout>([]).obs;

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    checkout.value.bindStream(getAllCheckout());
  }

  Stream<List<Checkout>> getAllCheckout() => documentReference
      .collection(DOCUMENT_NAME)
      .orderBy("timestamp", descending: true)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => Checkout.fromSnapshot(item)).toList());

  Checkout lastOrder() => checkout.value.isNotEmpty
      ? checkout.value[checkout.value.length - 1]
      : Checkout();
}
