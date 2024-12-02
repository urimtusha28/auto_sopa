import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isBold;
  final double fontSize;
  final Color color;

  CustomText({
    Key? key,
    required this.text,
    required this.isBold,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double responsiveFontSize = fontSize;
    if (screenWidth <= 320) {
      responsiveFontSize = fontSize * 0.8;
    } else if (screenWidth > 320 && screenWidth <= 480) {
      responsiveFontSize = fontSize * 0.9;
    }

    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Kanit',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: responsiveFontSize,
          color: color,
          overflow: TextOverflow.ellipsis),
      maxLines: 2,
    );
  }
}
