import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/utils/user_preference.dart';
import 'package:get/state_manager.dart';

class AddressController extends GetxController {
  var isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  String uid = UserPreferences.firebaseUser.uid.toString();

  RxList<Address> address = RxList<Address>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference =
        firebaseFirestore.collection('user').doc(uid).collection('address');
    address.bindStream(getAllAddress());
  }

  Stream<List<Address>> getAllAddress() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => Address.fromSnapshot(item)).toList());
}
