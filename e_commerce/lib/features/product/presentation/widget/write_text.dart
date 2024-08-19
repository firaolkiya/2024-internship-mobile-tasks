import 'package:flutter/material.dart';

Widget writeText(
    {required String text,
    double fontSize = 13,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: TextOverflow.clip
    ),
  );
}
