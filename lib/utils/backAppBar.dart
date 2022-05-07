import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String text) {
  return AppBar(
    title: Text(
      text,
      style: Theme.of(context).textTheme.headline3,
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
