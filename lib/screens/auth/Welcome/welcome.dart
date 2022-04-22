import 'package:ecommerce/screens/auth/Welcome/widget/body.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const WelcomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  // ignore: use_key_in_widget_constructors
  const WelcomePage();
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
