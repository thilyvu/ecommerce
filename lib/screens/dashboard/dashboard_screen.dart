import 'package:ecommerce/controller/navigation_controller.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/history/history_order_screen.dart';
import 'package:ecommerce/screens/profile/profile.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                  child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomeScreen(),
                  CartScreen(),
                  HistoryOrderPage(),
                  ProfilePage()
                ],
              )),
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.greenAccent,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  onTap: controller.changeIndex,
                  currentIndex: controller.tabIndex,
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(Icons.home, size: 20)),
                    BottomNavigationBarItem(
                      label: 'Cart',
                      icon: Icon(Icons.shopping_cart, size: 20),
                    ),
                    BottomNavigationBarItem(
                      label: 'History',
                      icon: Icon(Icons.receipt, size: 20),
                    ),
                    BottomNavigationBarItem(
                      label: 'User',
                      icon: Icon(Icons.account_circle_outlined, size: 20),
                    ),
                  ]),
            ));
  }
}
