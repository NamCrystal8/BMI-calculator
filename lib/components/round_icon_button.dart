import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton({required this.onPressed, required this.icon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      fillColor: Colors.grey[600],
    );
  }
}
