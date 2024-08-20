import 'package:flutter/material.dart';

import '../../../../core/util/constant/color.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.controller,  this.hint='',  this.isPassword=false});
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.blueColor),
          ),
          filled: true,
          fillColor: Colors.white10,
          hintStyle: const TextStyle(fontWeight: FontWeight.w100),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey,width: 0.25),
          ),
          ),
    );
  }
}
