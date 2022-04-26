import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/screens/profile/widget/input.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/utils/user_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);
  static const String routeName = '/profile/update_password';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const UpdatePasswordPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final verifyPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  // ignore: must_call_super
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    verifyPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current Password",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true,
                  controller: currentPassword,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (pass) => pass != null && pass.length < 6
                      ? "Enter min 6 characters"
                      : null,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Password",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true,
                  controller: newPassword,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (pass) => pass != null && pass.length < 6
                      ? "Enter min 6 characters"
                      : null,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirmation Password",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true,
                  controller: verifyPassword,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (pass) => pass != null && pass.length < 6
                      ? "Enter min 6 characters"
                      : null,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: 'Save',
              press: updatePassword,
              color: kAccent,
            )
          ],
        ),
      ),
    );
  }

  void updatePassword() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (newPassword.text.trim() == verifyPassword.text.trim()) {
      if (newPassword.text.trim() != currentPassword.text.trim()) {
        UserPreferences.checkCurrentPassword(
            currentPassword.text.trim(), context);
      } else {
        Utils.showSnackBar(
            'Current password & New password cannot be identical');
      }
    } else {
      Utils.showSnackBar('New password & Confirmation password are unmatched');
    }
  }
}
