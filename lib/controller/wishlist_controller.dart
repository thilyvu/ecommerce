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
    documentReference
        .collection('wishlist')
        .add(product.toJson())
        .whenComplete(() {
      Utils.showSnackBar("Added successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }

  void removeProductFromWishlist(String id) {
    documentReference.collection('wishlist').doc(id).delete().whenComplete(() {
      Get.back();
      Utils.showSnackBar("Deleted successfully", "primary");
    }).catchError((e) {
      Utils.showSnackBar("fail", "danger");
    });
  }
}
