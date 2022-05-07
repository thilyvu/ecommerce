import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  // ignore: use_key_in_widget_constructors
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
              image: AssetImage('assets/cactus.jpg'), height: 125, width: 125),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            'Ecomerce',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
