import 'package:ecommerce/screens/profile/widget/number_item.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberItem(
            context: context,
            value: '4.8',
            text: 'Ranking',
          ),
          buildDivider(),
          NumberItem(
            context: context,
            value: '4.8',
            text: 'Ranking',
          ),
          buildDivider(),
          NumberItem(
            context: context,
            value: '4.8',
            text: 'Ranking',
          ),
        ],
      ),
    );
  }

  // ignore: sized_box_for_whitespace
  Widget buildDivider() => Container(
        height: 24,
        child: const VerticalDivider(),
      );
}
