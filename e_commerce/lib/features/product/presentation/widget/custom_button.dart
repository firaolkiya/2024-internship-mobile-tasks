import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed, required this.text,  this.enable=true,
  });

  final VoidCallback onPressed;
  final String text;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return FilledButton(

        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: const Color.fromARGB(255,63, 81, 243),
          disabledBackgroundColor: const Color.fromARGB(255, 104, 132, 163),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          onPressed();

        },
        child:  Text(text));
  }
}