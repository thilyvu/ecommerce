import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/models/voucher_model.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/checkout/checkout_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;

  final String uid = Get.put(UserController()).uid;
  // final Address choseAddress = Get.find<AddressController>().choseAddress.value;

  var carts = RxList<Cart>([]).obs;
  var choseVoucher = Voucher().obs;
  var choseAddress = Address().obs;

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
    }).catchError((_) => Utils.showSnackBar("Can't update cart", "danger"));
  }

  void chooseVoucher(Voucher voucher) {
    choseVoucher.value = voucher;
    Utils.showSnackBar("Chose Voucher Successfully", "primary");
    Get.back();
  }

  void chooseAddress(Address address) {
    choseAddress.value = address;
    Get.back();
    Utils.showSnackBar("Chose Address", "primary");
  }

  Future deleteCart() async {
    var snapshots = await documentReference.collection('cart').get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    refeshCart();
  }

  void checkoutOrder(CartController cartController) {
    Checkout data = Checkout(
        carts: cartController.carts.value,
        address: cartController.choseAddress.value,
        voucher: cartController.choseVoucher.value,
        subTotal: Cart.subTotal(cartController.carts.value),
        total: Cart.total(
            cartController.carts.value, cartController.choseVoucher.value),
        deliveryFee: Cart.deliveryFee(),
        timestamp: Timestamp.fromDate(DateTime.now()),
        status: 1,
        rating: 3);
    documentReference
        .collection("checkout")
        .add(data.toJson())
        .whenComplete(() {
      Utils.showSnackBar("Checked out new order successfully", "primary");
      deleteCart();
      Get.to(() => CheckOutScreen());
    }).catchError((_) {
      Utils.showSnackBar("Check out new order failed", "danger");
    });
  }
}
