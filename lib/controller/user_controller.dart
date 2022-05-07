import 'dart:io';

import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

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
    avatarController.value = firebaseAuth.photoURL!;
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
      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
    }
  }

  Future updateAvatar() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(image.path);
    final imageFile = File('${directory.path}/$name');
    final newImage = await File(image.path).copy(imageFile.path);
    avatarController.value = newImage.path;
  }
}
