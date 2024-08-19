import 'package:flutter/material.dart';

import '../../../../core/util/constant/color.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.blueColor),
          ),
          filled: true,
          fillColor: Colors.white10,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey,width: 0.25),
          ),
          ),
    );
  }
}
