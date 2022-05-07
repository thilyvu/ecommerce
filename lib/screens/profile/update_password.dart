import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordPage extends GetView<UserController> {
  UpdatePasswordPage({Key? key}) : super(key: key);

  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final verifyPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Update Password"),
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
        controller.checkCurrentPassword(currentPassword.text.trim());
      } else {
        Utils.showSnackBar(
            'Current password & New password cannot be identical', 'danger');
      }
    } else {
      Utils.showSnackBar(
          'New password & Confirmation password are unmatched', 'danger');
    }
  }
}
