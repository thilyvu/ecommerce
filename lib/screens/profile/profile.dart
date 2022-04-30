import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/models/currentUserData.dart';
import 'package:ecommerce/screens/profile/edit_profile.dart';
import 'package:ecommerce/screens/profile/widget/avatar.dart';
import 'package:ecommerce/screens/profile/widget/number.dart';
import 'package:ecommerce/screens/profile/widget/profile_name.dart';
import 'package:ecommerce/screens/profile/widget/upgrade_button.dart';
import 'package:ecommerce/utils/backAppBar.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/utils/user_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ProfilePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late CurrentUser user;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AvatarWidget(
            imagePath: user.photoURL.toString(),
            onClick: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfilePage()));
              setState(() {});
            },
            isEdit: false,
          ),
          const SizedBox(
            height: 24,
          ),
          ProfileName(user: user),
          const SizedBox(
            height: 10,
          ),
          const NumberWidget(),
          const SizedBox(
            height: 10,
          ),
          ProfileButton(
              text: "Đổi mật khẩu",
              icon: const Icon(
                Icons.edit,
                size: 18,
                color: kAccent,
              ),
              onClick: () =>
                  Navigator.pushNamed(context, '/profile/update_password')),
          ProfileButton(
              text: "Đăng xuất",
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
      Navigator.pushNamed(context, '/welcome');
      Utils.showSnackBar('Logout successfully!', 'primary');
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utils.showSnackBar(e.message, 'danger');
    }
  }
}
