import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor{
  AppColor._();
  static const blueColor =  Color.fromARGB(255, 12, 38, 230);

  static Gradient gradient =const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(1, 64, 65, 66),Color.fromARGB(0,63, 81, 243)],
    
    );

}