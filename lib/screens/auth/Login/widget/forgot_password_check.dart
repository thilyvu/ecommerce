import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordCheck extends StatelessWidget {
  final VoidCallback press;
  const ForgotPasswordCheck({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                color: kPrimaryButton,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
