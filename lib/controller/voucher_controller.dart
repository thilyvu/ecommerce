import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

import '../models/voucher_model.dart';

class VoucherController extends GetxController {
  RxBool isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  var vouchers = RxList<Voucher>([]).obs;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('voucher');
    refeshCategories();
  }

  void refeshCategories() {
    isLoading.value = true;
    vouchers.value.bindStream(getAllVoucher());
    isLoading.value = false;
  }

  Stream<List<Voucher>> getAllVoucher() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => Voucher.fromSnapshot(item)).toList());

  void addNewVoucher(Voucher vouchers) {
    collectionReference.add(vouchers.toJson()).whenComplete(() {
      Get.back();
      refeshCategories();

      Utils.showSnackBar("New Voucher's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void chooseVoucher(Voucher vouchers) {
    collectionReference.add(vouchers.toJson()).whenComplete(() {
      Get.back();
      refeshCategories();

      Utils.showSnackBar("New Voucher's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
