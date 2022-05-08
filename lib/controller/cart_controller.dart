import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;

  final String uid = Get.find<UserController>().uid;

  var cart = RxList<Cart>([]).obs;

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    refeshCart();
  }

  void refeshCart() {
    isLoading.value = true;
    cart.value.bindStream(getAllCart());
    isLoading.value = false;
  }

  Stream<List<Cart>> getAllCart() =>
      documentReference.collection('cart').snapshots().map((query) =>
          query.docs.map((item) => Cart.fromSnapshot(item)).toList());

  Future addProductToCart(Product product) async {
    try {
      // await documentReference.collection('cart').add(product.toJson());
      Get.to(CartScreen());
      Utils.showSnackBar("Added successfully", "primary");
    } catch (_) {
      Utils.showSnackBar("fail", "danger");
    }

    // documentReference.collection('cart').add(product.toJson()).whenComplete(() {
    //   Get.to(CartScreen());
    //   Utils.showSnackBar("Added successfully", "primary");
    // }).catchError((e) {
    //   Utils.showSnackBar("fail", "danger");
    // });
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
