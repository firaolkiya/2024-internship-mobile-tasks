import 'package:flutter/material.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}