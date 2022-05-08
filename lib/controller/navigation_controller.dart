import 'package:get/get.dart';

class NavigationController extends GetxController {
  var tabIndex = 0;

  void changeIndex(int index) {
    tabIndex = index;
    update();
  }
}
