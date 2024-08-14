
import 'package:flutter/material.dart';

import '../../../../core/util/constant/image.dart';

Widget imageLoadFailed(){
  return Container(
    
    child: Image(
      fit: BoxFit.fill,
      image: AssetImage(AppImage.error)),
  );
}