import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final VoidCallback onPress;
  ReusableCard(@required this.color,@required this.cardChild,this.onPress);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
