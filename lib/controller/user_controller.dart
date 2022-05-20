import 'dart:io';

import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/auth/Login/login.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/utils/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  var user = CurrentUser().obs;
  RxString avatarController = "".obs;
  String uid = 'null';

  @override
  void onInit() {
    super.onInit();
    user.value = getUserFromFirebase();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null ? false : true;
  }

  CurrentUser getUserFromFirebase() {
    final User firebaseAuth = FirebaseAuth.instance.currentUser!;
    uid = firebaseAuth.uid;
    String photoURL = firebaseAuth.photoURL != null
        ? firebaseAuth.photoURL.toString()
        : "assets/images/avatar.jpg";
    avatarController.value = photoURL;
    return CurrentUser(
        user: firebaseAuth,
        photoURL: photoURL,
        displayName: firebaseAuth.displayName.toString(),
        email: firebaseAuth.email.toString());
  }

  String? validateDisplayName(String value) =>
      value.isEmpty ? "Display Name can not be empty" : null;

  Future updateUser(String newName) async {
    try {
      await user.value.user?.updatePhotoURL(avatarController.value);
      await user.value.user?.updateDisplayName(newName);
      user.value = getUserFromFirebase();
      Get.back();
      Utils.showSnackBar('Update profile successfully!', 'primary');
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  Future updatePassword(String newPass) async {
    try {
      await user.value.user?.updatePassword(newPass);
      Get.back();
      Utils.showSnackBar('Update profile successfully!', 'primary');
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  Future checkCurrentPassword(String newPass) async {
    final credential = EmailAuthProvider.credential(
        email: user.value.email.toString(), password: newPass);

    user.value.user?.reauthenticateWithCredential(credential).then((value) {
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
      Get.to(LoginPage());
      Utils.showSnackBar("Signed Up Successfully", 'primary');
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
    }
  }

  Future updateAvatar() async {
    ImagePicker _picker = ImagePicker();
    StorageService storage = StorageService();

    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image == null) {
      Utils.showSnackBar('No image was selected', 'danger');
    }
    if (_image != null) {
      await storage.uploadImage(_image);
      var imageURL = await storage.getDownloadURL(_image.name);
      avatarController.value = imageURL;
    }
  }
}
