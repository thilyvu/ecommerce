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
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

class UpdateProfilePage extends GetView<UserController> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newImg = 'null';
    return Scaffold(
      appBar: buildAppBar(context, "Update Profile"),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            AvatarWidget(
                imagePath: controller.user.photoURL!,
                onClick: updateAvatar,
                isEdit: true),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => InputWidget(
                  controller:
                      TextEditingController(text: controller.user.email!),
                  label: 'Email',
                  isEnabled: false),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => InputWidget(
                  controller: TextEditingController(
                      text: controller.nameController.value),
                  label: 'Display Name',
                )),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: 'Save',
              press: updateProfile,
              color: kAccent,
            )
          ],
        ),
      ),
    );
  }

  void updateProfile() {
    controller.updateUser(controller.user);
  }

  Future updateAvatar() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(image.path);
    final imageFile = File('${directory.path}/$name');
    final newImage = await File(image.path).copy(imageFile.path);
    controller.user.copy(photoURL: newImage.path);
  }
}
