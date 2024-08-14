import 'package:flutter/material.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text('failed',style: TextStyle(fontSize: 20,color: Colors.black),),
    );
  }
}