import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/screens/auth/Signup/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<UserController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignUp(),
    );
  }
}
