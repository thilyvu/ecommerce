import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    leading: BackButton(
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
