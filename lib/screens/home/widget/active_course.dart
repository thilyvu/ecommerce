import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/home/widget/category_title.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveCourse extends StatelessWidget {
  const ActiveCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          const CategoryTitle('Current active', 'View All'),
          Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: kFontLight.withOpacity(0.1),
                border:
                    Border.all(color: kFontLight.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/progress.jpg',
                            width: 60)),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Symetry theory',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kFont),
                        ),
                        Text(
                          '2 lesson left',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kFontLight),
                        )
                      ],
                    ),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: 0.61,
                  center: const Text(
                    '61%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  progressColor: kAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
