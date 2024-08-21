
import 'package:flutter/material.dart';

import '../../../../core/constant/image.dart';

Widget imageLoadFailed(){
  return Container(
    
    child: Image(
      fit: BoxFit.fill,
      image: AssetImage(AppImage.error)),
  );
}