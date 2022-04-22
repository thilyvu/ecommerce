import 'dart:convert';

import 'package:ecommerce/models/currentUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static User getUserFromFirebase() {
    return FirebaseAuth.instance.currentUser!;
  }

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(CurrentUser user) async {
    // user.user.updateDisplayName(user.displayName);
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    // ignore: unused_local_variable
    // final json = _preferences.getString(_keyUser);

    return getUserFromFirebase();
  }
}
