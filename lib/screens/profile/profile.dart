import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/screens/auth/Welcome/welcome.dart';
import 'package:ecommerce/screens/profile/edit_profile.dart';
import 'package:ecommerce/screens/profile/update_password.dart';
import 'package:ecommerce/screens/profile/widget/avatar.dart';
import 'package:ecommerce/screens/profile/widget/number.dart';
import 'package:ecommerce/screens/profile/widget/profile_name.dart';
import 'package:ecommerce/screens/profile/widget/upgrade_button.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          Obx(() => AvatarWidget(
                imagePath: controller.user.value.photoURL!,
                onClick: () => Get.to(UpdateProfilePage()),
                isEdit: false,
              )),
          const SizedBox(
            height: 24,
          ),
          ProfileName(),
          const SizedBox(
            height: 10,
          ),
          // const NumberWidget(),
          const SizedBox(
            height: 10,
          ),
          ProfileButton(
              text: "Change Password",
              icon: const Icon(
                Icons.edit,
                size: 18,
                color: kAccent,
              ),
              onClick: () => Get.to(() => UpdatePasswordPage())),
          ProfileButton(
              text: "Logout",
              icon: const Icon(
                Icons.logout,
                size: 18,
                color: kAccent,
              ),
              onClick: logOut),
        ],
      ),
    );
  }

  Future logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.to(() => WelcomePage());
      Utils.showSnackBar('Logout successfully!', 'primary');
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
    }
  }
}
