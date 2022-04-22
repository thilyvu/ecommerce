// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser {
  final User user;
  final String photoURL;
  final String displayName;
  final String email;

  const CurrentUser({
    required this.user,
    required this.photoURL,
    required this.displayName,
    required this.email,
  });

  CurrentUser copy({
    User? user,
    String? photoURL,
    String? displayName,
    String? email,
  }) =>
      CurrentUser(
        user: this.user,
        photoURL: photoURL ?? this.photoURL,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
      );

  static CurrentUser fromJson(Map<String, dynamic> json) => CurrentUser(
      user: json['user'],
      photoURL: json['photoURL'],
      displayName: json['displayName'],
      email: json['email']);

  Map<String, dynamic> toJson() => {
        'user': user,
        'photoURL': photoURL,
        'displayName': displayName,
        'email': email,
      };

  // static final User user = FirebaseAuth.instance.currentUser!;
  // static CurrentUser getUserFromFirebase() {
  //   final String uid = user.uid;
  //   final String displayName = user.displayName == 'null'
  //       ? user.displayName.toString()
  //       : 'User_' + uid;
  //   final String email = user.email.toString();
  //   final String photoURL = user.photoURL == 'null'
  //       ? user.photoURL.toString()
  //       : "assets/images/avatar.jpg";
  //   final String emailVerified = user.emailVerified.toString();
  //   // here you write the codes to input the data into firestore
  //   return new CurrentUser(uid, photoURL, displayName, email);
  // }

  // void updatePassword(String currentPassword, String newPassword) {
  //   final cred = EmailAuthProvider.credential(
  //       email: user.email.toString(), password: currentPassword);

  //   user.reauthenticateWithCredential(cred).then((value) {
  //     user.updatePassword(newPassword).then((_) {
  //       Utils.showSnackBar('Updated password successfully!');
  //     }).catchError((e) {
  //       Utils.showSnackBar(e.toString());
  //     });
  //   }).catchError((err) {
  //     Utils.showSnackBar(err.toString());
  //   });
  // }
}
