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
}
