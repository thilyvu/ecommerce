import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: const Icon(Icons.home),
          color: Colors.white,
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person, color: Colors.white))
      ]),
    );
  }
}
// bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: kBackground,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: [
//             BottomNavigationBarItem(
//                 label: 'home',
//                 icon: Container(
//                   padding: EdgeInsets.only(bottom: 5),
//                   decoration: BoxDecoration(
//                       border:
//                           Border(bottom: BorderSide(color: kAccent, width: 2))),
//                   child: Text(
//                     'home',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 )),
//             BottomNavigationBarItem(
//               label: 'calendar',
//               icon: Icon(Icons.calendar_month, size: 20),
//             ),
//             BottomNavigationBarItem(
//               label: 'bookmark',
//               icon: Icon(Icons.bookmark, size: 20),
//             ),
//             BottomNavigationBarItem(
//               label: 'user',
//               icon: Icon(Icons.account_circle_outlined, size: 20),
//             ),
//           ]),
