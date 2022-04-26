import 'package:ecommerce/models/currentUserData.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  final CurrentUser user;
  const ProfileName({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.displayName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
