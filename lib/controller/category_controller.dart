import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  var category = RxList<Category>([]).obs;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('categories');
    refeshCategories();
  }

  void refeshCategories() {
    isLoading.value = true;
    category.value.bindStream(getAllCategory());
    isLoading.value = false;
  }

  Stream<List<Category>> getAllCategory() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => Category.fromSnapshot(item)).toList());

  void addNewCategory(Category category) {
    collectionReference.add(category.toJson()).whenComplete(() {
      Get.back();
      refeshCategories();

      Utils.showSnackBar("New Category's added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
