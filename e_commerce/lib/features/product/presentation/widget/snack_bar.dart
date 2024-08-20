
import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context,String text){
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text,style: const TextStyle(color: Colors.red),),backgroundColor: Colors.white,dismissDirection: DismissDirection.startToEnd,)
     );
}