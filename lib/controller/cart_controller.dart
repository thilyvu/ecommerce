import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;

  final String uid = Get.find<UserController>().uid;
  final Address choseAddress = Get.find<AddressController>().choseAddress.value;

  var carts = RxList<Cart>([]).obs;

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    refeshCart();
  }

  void refeshCart() {
    isLoading.value = true;
    carts.value.bindStream(getAllCart());
    isLoading.value = false;
  }

  Stream<List<Cart>> getAllCart() =>
      documentReference.collection('cart').snapshots().map((query) =>
          query.docs.map((item) => Cart.fromSnapshot(item)).toList());

  void increaseCartItem(Product product) {
    final index = carts.value
        .indexWhere((element) => element.product!.name == product.name);
    index == -1
        ? addNewItemToCart(product)
        : updateQuantity(carts.value[index], true);
  }

  void addNewItemToCart(Product product) {
    documentReference
        .collection('cart')
        .add(Cart(product: product, quantity: 1).toJson())
        .whenComplete(() {
      Utils.showSnackBar("Added item to cart list successfully", "primary");
      refeshCart();
    }).catchError(
            (_) => Utils.showSnackBar("Can't add new item to cart", "danger"));
  }

  void decreasedCartItem(int index, Cart cart) {
    final quantity = cart.quantity!.toInt() - 1;
    quantity <= 0 ? removeItemFromCart(cart.id!) : updateQuantity(cart, false);
  }

  void removeItemFromCart(String id) {
    documentReference.collection('cart').doc(id).delete().whenComplete(() {
      Utils.showSnackBar("Removed item from cart successfully", "primary");
      refeshCart();
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void updateQuantity(Cart cart, bool isIncrease) {
    final newQuantity =
        isIncrease ? cart.quantity!.toInt() + 1 : cart.quantity!.toInt() - 1;
    documentReference
        .collection('cart')
        .doc(cart.id)
        .update(Cart(product: cart.product, quantity: newQuantity).toJson())
        .whenComplete(() {
      Utils.showSnackBar("updated item quantity successfully", "primary");
      refeshCart();
    }).catchError(
            (_) => Utils.showSnackBar("Can't add new item to cart", "danger"));
  }
}
