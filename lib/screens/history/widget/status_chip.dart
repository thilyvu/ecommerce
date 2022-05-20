import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final int status;
  const StatusChip({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = status == 1
        ? Colors.blue
        : status == 2
            ? Colors.green
            : status == 3
                ? Colors.grey
                : Colors.red;

    final text = status == 1
        ? "In Progress"
        : status == 2
            ? "Delivering"
            : status == 3
                ? "Finished"
                : "Canceled";
    return Chip(
      padding: EdgeInsets.all(0),
      backgroundColor: color,
      label: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
