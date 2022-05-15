import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference documentReference;
  String uid = Get.find<UserController>().uid;

  RxList<Wishlist> wishlist = RxList<Wishlist>([]);

  @override
  void onInit() {
    super.onInit();
    documentReference = firebaseFirestore.collection('user').doc(uid);
    wishlist.bindStream(getAllWishlist());
  }

  Stream<List<Wishlist>> getAllWishlist() =>
      documentReference.collection('wishlist').snapshots().map((query) =>
          query.docs.map((item) => Wishlist.fromSnapshot(item)).toList());

  void addProductToWishlist(Product product) {
    final index = wishlist.value
        .indexWhere((element) => element.product!.name == product.name);
    if (index != -1) {
      documentReference
          .collection('wishlist')
          .add(Wishlist(product: product).toJson())
          .whenComplete(() {
        Utils.showSnackBar("Added successfully", "primary");
      }).catchError((e) {
        Utils.showSnackBar("fail", "danger");
      });
    } else {
      Utils.showSnackBar("Product is available in your Wishlist!", "primary");
    }
  }

  void removeProductFromWishlist(String id) {
    documentReference.collection('wishlist').doc(id).delete().whenComplete(() {
      Get.back();
      Utils.showSnackBar("Remove from Wishlist successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
