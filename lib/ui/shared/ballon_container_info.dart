import 'package:flutter/material.dart';

class BallonContainerInfo extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;

  const BallonContainerInfo({
    super.key,
    required this.backgroundColor,
    required this.text,
    this.textColor = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'LexendDeca',
            ),
          ),
        ),
      ),
      ],
    );
  }
}
