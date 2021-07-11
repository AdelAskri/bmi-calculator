import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colorVar,
      required this.cardChild,
      required this.onPressed});

  final Color colorVar;
  final Widget cardChild;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colorVar,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
