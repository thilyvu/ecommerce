import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;

  final String uid = Get.find<UserController>().uid;

  RxList<Cart> cart = RxList<Cart>([]);

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    cart.bindStream(getAllCart());
  }

  Stream<List<Cart>> getAllCart() =>
      documentReference.collection('cart').snapshots().map((query) =>
          query.docs.map((item) => Cart.fromSnapshot(item)).toList());

  void addProductToCart(Product product) {
    documentReference
        .collection('product')
        .add(product.toJson())
        .whenComplete(() {
      Get.to(CartScreen());
      Utils.showSnackBar("Added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void removeProduct(String id) {
    documentReference.collection('cart').doc(id).delete().whenComplete(() {
      Get.back();
      Utils.showSnackBar("Deleted successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
