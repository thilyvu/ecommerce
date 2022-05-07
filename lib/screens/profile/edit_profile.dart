import 'dart:io';

import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/screens/profile/widget/avatar.dart';
import 'package:ecommerce/screens/profile/widget/input.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UpdateProfilePage extends GetView<UserController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String nameController = controller.user.value.displayName!;
    return Scaffold(
      appBar: buildAppBar(context, "Update Profile"),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            Obx(() => AvatarWidget(
                imagePath: controller.avatarController.value,
                onClick: controller.updateAvatar,
                isEdit: true)),
            const SizedBox(
              height: 10,
            ),
            InputWidget(
                text: controller.user.value.email!,
                label: 'Email',
                isEnabled: false,
                onChanged: (value) {}),
            const SizedBox(
              height: 10,
            ),
            InputWidget(
                text: nameController,
                label: 'Display Name',
                isEnabled: true,
                onChanged: (value) => nameController = value),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: 'Save',
              press: () => updateProfile(nameController),
              color: kAccent,
            )
          ],
        ),
      ),
    );
  }

  void updateProfile(String name) {
    controller.updateUser(name);
  }
}
