import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context,) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
