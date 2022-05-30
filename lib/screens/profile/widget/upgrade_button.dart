import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Icon icon;
  const ProfileButton(
      {Key? key, required this.text, required this.onClick, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon.icon),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
