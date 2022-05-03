import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/checkout_model.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStorePreference {
  static User firebaseUser = FirebaseAuth.instance.currentUser!;

  static Future createNewUserFireStore(User? user, BuildContext context) async {
    try {
      String id = user!.uid.toString();
      FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .set({'Address': [], 'Checkout': {}, 'Cart': {}, 'Wishlist': {}});
    } catch (e) {
      Utils.showSnackBar(e.toString(), 'danger');
    }
  }

  // static Future addNewAddress(Checkout data, BuildContext context) async {
  //   try {
  //     FirebaseFirestore.instance
  //         .collection('user')
  //         .doc(firebaseUser.uid.toString())
  //         .set({
  //       'Address': [
  //         {
  //           'name': data.fullName,
  //           'phone': data.,
  //           'ward': "",
  //           'street': "",
  //           'district': "",
  //         }
  //       ]
  //     });
  //   } catch (e) {
  //     Utils.showSnackBar(e.toString(), 'danger');
  //   }
  // }
}
