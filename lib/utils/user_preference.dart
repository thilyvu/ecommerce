import 'dart:convert';

import 'package:ecommerce/models/currentUserData.dart';
import 'package:ecommerce/utils/firestore_preference.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyUser = 'user';

  static late SharedPreferences _preferences;
  static late CurrentUser user;
  static User firebaseUser = FirebaseAuth.instance.currentUser!;

  static CurrentUser getUserFromFirebase() {
    String photoURL = firebaseUser.photoURL != null
        ? firebaseUser.photoURL.toString()
        : "assets/images/avatar.jpg";
    return CurrentUser(
        photoURL: photoURL,
        user: firebaseUser,
        displayName: firebaseUser.displayName.toString(),
        email: firebaseUser.email.toString());
  }

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    user = await getUserFromFirebase();
  }

  static CurrentUser getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? user : CurrentUser.fromJson(jsonDecode(json));
  }

  static Future setUser(CurrentUser newUser, BuildContext context) async {
    try {
      await firebaseUser.updatePhotoURL(newUser.photoURL);
      await firebaseUser.updateDisplayName(newUser.displayName);

      Navigator.pop(context);
      Utils.showSnackBar('Update profile successfully!', 'primary');

      await _preferences.setString(_keyUser, jsonEncode(newUser.toJson()));
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  static Future updatePassword(String newPass, BuildContext context) async {
    try {
      await firebaseUser.updatePassword(newPass);
      Navigator.pop(context);
      Utils.showSnackBar('Update profile successfully!', 'primary');
    } catch (_) {
      Utils.showSnackBar('Invalid information. Please try again', 'danger');
    }
  }

  static Future checkCurrentPassword(
      String newPass, BuildContext context) async {
    final credential =
        EmailAuthProvider.credential(email: user.email, password: newPass);

    firebaseUser.reauthenticateWithCredential(credential).then((value) {
      updatePassword(newPass, context);
    }).catchError(
        (e) => Utils.showSnackBar("Current password is incorrect", 'danger'));
  }

  static Future createNewUser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.user?.updateDisplayName(name);
      Navigator.pushNamed(context, '/home');
      FireStorePreference.createNewUserFireStore(user.user, context);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
    }
  }
}
