import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/icons/text_field_container.dart';
import 'package:ecommerce/screens/auth/Login/widget/background.dart';
import 'package:ecommerce/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyForgotPass extends StatefulWidget {
  const BodyForgotPass({Key? key}) : super(key: key);

  @override
  State<BodyForgotPass> createState() => _BodyForgotPassState();
}

class _BodyForgotPassState extends State<BodyForgotPass> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  // ignore: must_call_super
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Receive an email to reset your password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextFormField(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Enter a valid email"
                        : null,
              ),
            ),
            RoundedButton(text: "Reset Password", press: sendEmail),
          ],
        ),
      ),
    );
  }

  Future sendEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Password Reset Email Sent!');
      // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utils.showSnackBar(e.message);
      // navigatorKey.currentState!.pop();
    }
  }
}
