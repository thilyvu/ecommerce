import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/screens/auth/Login/widget/already_have_an_account_acheck.dart';
import 'package:ecommerce/icons/rounded_button.dart';
import 'package:ecommerce/icons/text_field_container.dart';
import 'package:ecommerce/screens/auth/Signup/widget/background.dart';
import 'package:ecommerce/screens/auth/Signup/widget/or_divider.dart';
import 'package:ecommerce/screens/auth/Signup/widget/social_icon.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Login/login.dart';

class BodySignUp extends GetView<UserController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: nameController,
                  cursorColor: kPrimaryButton,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryButton,
                    ),
                    hintText: "Your Display Name",
                    border: InputBorder.none,
                  ),
                  validator: (value) => controller.validateDisplayName(value!),
                ),
              ),
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
              TextFieldContainer(
                  child: TextFormField(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (pass) => pass != null && pass.length < 6
                    ? "Enter min 6 characters"
                    : null,
              )),
              RoundedButton(
                text: "SIGNUP",
                press: signUp,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              ),
              const OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    controller.createNewUser(emailController.text.trim(),
        passwordController.text.trim(), nameController.text.trim());
  }
}
