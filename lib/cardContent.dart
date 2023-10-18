import 'package:bmi_calculator/constaints.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  late IconData icon;
  late String textContent;

  CardContent(this.icon, this.textContent);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          textContent,
          style: labelTextStyle,
        )
      ],
    );
  }
}
