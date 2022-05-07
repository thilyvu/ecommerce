import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends GetView {
  final mainPage;
  final isLoading;
  const LoadingScreen({Key? key, this.mainPage, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return mainPage;
    }
  }
}
