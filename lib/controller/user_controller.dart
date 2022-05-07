import 'dart:convert';

import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  CurrentUser user = CurrentUser();
  late RxString nameController = "".obs;
  String uid = 'null';

  @override
  void onInit() {
    super.onInit();
    user = getUserFromFirebase();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null ? false : true;
  }

  CurrentUser getUserFromFirebase() {
    final User firebaseAuth = FirebaseAuth.instance.currentUser!;
    uid = firebaseAuth.uid;
    nameController.value = firebaseAuth.displayName!;
    String photoURL = firebaseAuth.photoURL != null
        ? firebaseAuth.photoURL.toString()
        : "assets/images/avatar.jpg";
    return CurrentUser(
        user: firebaseAuth,
        photoURL: photoURL,
        displayName: firebaseAuth.displayName.toString(),
        email: firebaseAuth.email.toString());
  }

  String? validateDisplayName(String value) =>
      value.isEmpty ? "Display Name can not be empty" : null;

  Future updateUser(CurrentUser newUser) async {
    try {
      await user.user?.updatePhotoURL(newUser.photoURL);
      await user.user?.updateDisplayName(newUser.displayName);

      Get.back();
      Utils.showSnackBar('Update profile successfully!', 'primary');
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  Future updatePassword(String newPass) async {
    try {
      await user.user?.updatePassword(newPass);
      Get.back();
      Utils.showSnackBar('Update profile successfully!', 'primary');
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  Future checkCurrentPassword(String newPass) async {
    final credential = EmailAuthProvider.credential(
        email: user.email.toString(), password: newPass);

    user.user?.reauthenticateWithCredential(credential).then((value) {
      updatePassword(newPass);
    }).catchError(
        (e) => Utils.showSnackBar("Current password is incorrect", 'danger'));
  }

  Future createNewUser(String email, String password, String name) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.user?.updateDisplayName(name);
      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
    }
  }
}
