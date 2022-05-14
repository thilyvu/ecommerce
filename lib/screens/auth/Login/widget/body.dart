import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/screens/auth/ForgotPass/forgotPass.dart';
import 'package:ecommerce/screens/auth/Login/widget/already_have_an_account_acheck.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/icons/text_field_container.dart';
import 'package:ecommerce/screens/auth/Login/widget/background.dart';
import 'package:ecommerce/screens/auth/Signup/signup.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'forgot_password_check.dart';

class BodyLogin extends GetView<UserController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextField(
                controller: emailController,
                cursorColor: kPrimaryButton,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryButton,
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
                child: TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: kPrimaryButton,
              decoration: const InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryButton,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimary,
                ),
                border: InputBorder.none,
              ),
            )),
            ForgotPasswordCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ForgotPassPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(text: "LOGIN", press: signIn),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.to(DashboardPage());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message, 'danger');
      passwordController.clear();
    }
  }
}
