import 'dart:io';

import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/models/currentUserData.dart';
import 'package:ecommerce/screens/profile/widget/avatar.dart';
import 'package:ecommerce/screens/profile/widget/input.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:ecommerce/utils/user_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  static const String routeName = '/profile/edit';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const EditProfilePage(),
      settings: const RouteSettings(name: routeName),
    );
  }
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late CurrentUser user;

  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    User user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          AvatarWidget(
              imagePath: user.photoURL,
              onClick: () async {
                final image =
                    // ignore: deprecated_member_use
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (image == null) return;
                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);
                setState(() => user = user.copy(photoURL: newImage.path));
              },
              isEdit: true),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Email',
              text: user.email,
              isEnabled: false,
              onChanged: (email) => user = user.copy(email: email)),
          const SizedBox(
            height: 10,
          ),
          InputWidget(
              label: 'Full Name',
              text: user.displayName,
              onChanged: (name) => user = user.copy(displayName: name)),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
            text: 'Save',
            press: updateProfile,
            color: kAccent,
          )
        ],
      ),
    );
  }

  void updateProfile() {
    UserPreferences.setUser(user);
    // navigatorKey.currentState!.pop();
  }
}
