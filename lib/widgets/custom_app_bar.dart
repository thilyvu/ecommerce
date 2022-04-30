import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showHeartIcon;
  const CustomAppBar({Key? key, required this.title, this.showHeartIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Align(
        alignment: Alignment.center,
        child: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            )),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: !showHeartIcon
          ? []
          : [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/wishlist');
                  },
                  icon: Icon(Icons.favorite))
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
