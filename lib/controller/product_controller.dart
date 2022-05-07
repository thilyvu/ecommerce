import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  RxList<Product> products = RxList<Product>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('products');
    products.bindStream(getAllProducts());
  }

  Stream<List<Product>> getAllProducts() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => Product.fromSnapshot(item)).toList());

  List<Product> getProductsByCategoryId(String categoryId) =>
      products.where((product) => product.category == categoryId).toList();

  List<Product> getProductsRecommend() =>
      products.where((product) => product.isRecommend!).toList();

  List<Product> getProductsPopular() =>
      products.where((product) => product.isPopular!).toList();

  List<Product> getProductsSpecial() => products
      .where((product) => !product.isPopular! || !product.isRecommend!)
      .toList();

  Product getProductById(String id) =>
      products.where((item) => item.id == id).elementAt(0);
}
