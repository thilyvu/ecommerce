import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  RxList<Category> category = RxList<Category>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('categories');
    category.bindStream(getAllCategory());
  }

  Stream<List<Category>> getAllCategory() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => Category.fromSnapshot(item)).toList());

  void addNewCategory(Category category) {
    collectionReference.add(category.toJson()).whenComplete(() {
      Get.back();
      Utils.showSnackBar("New Category's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
