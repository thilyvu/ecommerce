import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/icons/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
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
      ),
    );
  }
}
